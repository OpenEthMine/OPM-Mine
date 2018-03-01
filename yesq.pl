__attribute__((reqd_work_group_size(WORKSIZE, 1, 1)))
__kernel void search(__global const uchar* restrict input, __global uint* restrict output, __global uchar *padcache, __global uchar* buff1, __global uchar* buff2, __global uchar* buff3, const uint target)
{

	__global ulong16 *hashbuffer = (__global ulong16 *)(padcache + (2048 * 128 * sizeof(ulong)* (get_global_id(0) % MAX_GLOBAL_THREADS)));
	__global ulong16 *prevstate = (__global ulong16 *)(buff1 + (64 * 128 * sizeof(ulong)*(get_global_id(0) % MAX_GLOBAL_THREADS)));
	__global uint8 *sha256tokeep = (__global uint8 *)(buff3 + (8 * sizeof(uint)*(get_global_id(0) % MAX_GLOBAL_THREADS)));
	__global ulong16 *Bdev = (__global ulong16 *)(buff2 + (8 * 128 * sizeof(ulong)* (get_global_id(0) % MAX_GLOBAL_THREADS)));



	uint nonce = (get_global_id(0));
	uint  data[20];
	uint16 in;
	uint8 state1, state2;
//	uint8 sha256tokeep;

//	ulong16 Bdev[8]; // will require an additional buffer
	((uint16 *)data)[0] = ((__global const uint16 *)input)[0];
	((uint4  *)data)[4] = ((__global const uint4  *)input)[4];
//	for (int i = 0; i<20; i++) { data[i] = SWAP32(data[i]); }
	//	if (nonce == 10) { printf("data %08x %08x\n", data[0], data[1]); }
	uint8 passwd = sha256_80(data, nonce);
	//pbkdf		
	in.lo = pad1.lo ^ passwd;
	in.hi = pad1.hi;
	state1 = sha256_Transform(in, H256);

	in.lo = pad2.lo ^ passwd;
	in.hi = pad2.hi;
	state2 = sha256_Transform(in, H256);

	in = ((uint16*)data)[0];
	state1 = sha256_Transform(in, state1);
#pragma unroll 1
	for (int i = 0; i<8; i++)
	{
		uint16 result;
		in = pad3;
		in.s0 = data[16];
		in.s1 = data[17];
		in.s2 = data[18];
		in.s3 = nonce;
		in.s4 = 4 * i + 1;
		in.lo = sha256_Transform(in, state1);
		in.hi = pad4;
		result.lo = swapvec(sha256_Transform(in, state2));
		if (i == 0) sha256tokeep[0] = result.lo;
		in = pad3;
		in.s0 = data[16];
		in.s1 = data[17];
		in.s2 = data[18];
		in.s3 = nonce;
		in.s4 = 4 * i + 2;
		in.lo = sha256_Transform(in, state1);
		in.hi = pad4;
		result.hi = swapvec(sha256_Transform(in, state2));
		Bdev[i].lo = as_ulong8(shuffle(result));
//		Bdev[i].lo = as_ulong8(result);
		in = pad3;
		in.s0 = data[16];
		in.s1 = data[17];
		in.s2 = data[18];
		in.s3 = nonce;
		in.s4 = 4 * i + 3;
		in.lo = sha256_Transform(in, state1);
		in.hi = pad4;
		result.lo = swapvec(sha256_Transform(in, state2));
		in = pad3;
		in.s0 = data[16];
		in.s1 = data[17];
		in.s2 = data[18];
		in.s3 = nonce;
		in.s4 = 4 * i + 4;
		in.lo = sha256_Transform(in, state1);
		in.hi = pad4;
		result.hi = swapvec(sha256_Transform(in, state2));


		Bdev[i].hi = as_ulong8(shuffle(result));
//		Bdev[i].hi = as_ulong8(result);
	}

	//mixing1

	prevstate[0] = Bdev[0];
	Bdev[0] = blockmix_salsa8_small2(Bdev[0]);
	prevstate[1] = Bdev[0];
	Bdev[0] = blockmix_salsa8_small2(Bdev[0]);

	uint n = 1;
#pragma unroll 1
	for (uint i = 2; i < 64; i++)
	{

		prevstate[i] = Bdev[0];

		if ((i&(i - 1)) == 0) n = n << 1;

		uint j = as_uint2(Bdev[0].hi.s0).x & (n - 1);

		j += i - n;
		Bdev[0] ^= prevstate[j];

		Bdev[0] = blockmix_salsa8_small2(Bdev[0]);
	}


}



__attribute__((reqd_work_group_size(WORKSIZE, 1, 1)))
__kernel void search1(__global uchar *buffer1, __global uchar *buffer2)
{
}




__attribute__((reqd_work_group_size(WORKSIZE, 1, 1)))
__kernel void search2(__global uchar *padcache, __global uchar *buff1, __global uchar *buff2)
{

			__global ulong16 *hashbuffer = (__global ulong16 *)(padcache + (2048 * 128 * sizeof(ulong)* (get_global_id(0) % MAX_GLOBAL_THREADS)));
			__global ulong16* prevstate =  (__global ulong16 *)(buff1 +      (64 * 128 * sizeof(ulong)* (get_global_id(0) % MAX_GLOBAL_THREADS)));
			__global ulong16 *Bdev =       (__global ulong16 *)(buff2 +       (8 * 128 * sizeof(ulong)* (get_global_id(0) % MAX_GLOBAL_THREADS)));


			for (int i = 0; i<8; i++)
				hashbuffer[i] = Bdev[i];

			blockmix_pwxform((__global ulong8*)Bdev, prevstate);


			for (int i = 0; i<8; i++)
				hashbuffer[i + 8] = Bdev[i];

			blockmix_pwxform((__global ulong8*)Bdev, prevstate);
			int n = 1;
#pragma unroll 1
			for (int i = 2; i < 2048; i ++)
			{

				for (int k = 0; k<8; k++)
					(hashbuffer + 8 * i)[k] = Bdev[k];


				if ((i&(i - 1)) == 0) n = n << 1;

				uint j = as_uint2(Bdev[7].hi.s0).x & (n - 1);
				j += i - n;

				for (int k = 0; k < 8; k++)
					Bdev[k] ^= (hashbuffer + 8 * j)[k];


				blockmix_pwxform((__global ulong8*)Bdev, prevstate);
            }
}

/*
__attribute__((reqd_work_group_size(WORKSIZE, 1, 1)))
__kernel void search3(__global uchar *buffer1, __global uchar *buffer2)
{
}
*/


__attribute__((reqd_work_group_size(WORKSIZE, 1, 1)))
__kernel void search3(__global uchar *padcache, __global uchar *buff1, __global uchar *buff2)
{

	__global ulong16 *hashbuffer = (__global ulong16 *)(padcache + (2048 * 128 * sizeof(ulong)* (get_global_id(0) % MAX_GLOBAL_THREADS)));
	__global ulong16* prevstate = (__global ulong16 *)(buff1 + (64 * 128 * sizeof(ulong)* (get_global_id(0) % MAX_GLOBAL_THREADS)));
	__global ulong16 *Bdev = (__global ulong16 *)(buff2 + (8 * 128 * sizeof(ulong)* (get_global_id(0) % MAX_GLOBAL_THREADS)));


#pragma unroll 1
	for (int z = 0; z < 684; z++)
	{

		uint j = as_uint2(Bdev[7].hi.s0).x & 2047;


		for (int k = 0; k < 8; k++)
			Bdev[k] ^= (hashbuffer + 8 * j)[k];

		if (z<682)
			for (int k = 0; k<8; k++)
				(hashbuffer + 8 * j)[k] = Bdev[k];

		blockmix_pwxform((__global ulong8*)Bdev, prevstate);
////
	}

}

/*
__attribute__((reqd_work_group_size(WORKSIZE, 1, 1)))
__kernel void search5(__global uchar *buffer1, __global uchar *buffer2)
{
}
*/

__attribute__((reqd_work_group_size(WORKSIZE, 1, 1)))
__kernel void search4(__global const uchar* restrict input, __global uint* restrict output, __global uchar *buff2,__global uchar* buff3, const uint target)
{

	__global ulong16 *Bdev =     (__global ulong16 *)(buff2 + (8 * 128 * sizeof(ulong)* (get_global_id(0) % MAX_GLOBAL_THREADS)));
	__global uint8 *sha256tokeep = (__global uint8 *)(buff3 + (8 * sizeof(uint)*(get_global_id(0) % MAX_GLOBAL_THREADS)));

	uint nonce = (get_global_id(0));


	uint  data[20];
	((uint16 *)data)[0] = ((__global const uint16 *)input)[0];
	((uint4  *)data)[4] = ((__global const uint4  *)input)[4];
//	for (int i = 0; i<20; i++) { data[i] = SWAP32(data[i]); }
	uint8 swpass = swapvec(sha256tokeep[0]);
    uint16 in;
    uint8 state1,state2;
	in.lo = pad1.lo ^ swpass;
	in.hi = pad1.hi;


	state1 = sha256_Transform(in, H256);

	in.lo = pad2.lo ^ swpass;
	in.hi = pad2.hi;
	state2 = sha256_Transform(in, H256);

#pragma unroll 1
	for (int i = 0; i<8; i++) {
		in = unshuffle(Bdev[i].lo);
		in = swapvec16(in);
		state1 = sha256_Transform(in, state1);
		in = unshuffle(Bdev[i].hi);
		in = swapvec16(in);
		state1 = sha256_Transform(in, state1);
	}
	in = pad5;
	state1 = sha256_Transform(in, state1);
	in.lo = state1;
	in.hi = pad4;
	uint8 res = sha256_Transform(in, state2);

	//hmac and final sha

	in.lo = pad1.lo ^ res;
	in.hi = pad1.hi;
	state1 = sha256_Transform(in, H256);
	in.lo = pad2.lo ^ res;
	in.hi = pad2.hi;
	state2 = sha256_Transform(in, H256);
	in = ((uint16*)data)[0];
	state1 = sha256_Transform(in, state1);
	in = padsha80;
	in.s0 = data[16];
	in.s1 = data[17];
	in.s2 = data[18];
	in.s3 = get_global_id(0);
	in.sf = 0x480;
	state1 = sha256_Transform(in, state1);
	in.lo = state1;
	in.hi = pad4;
	state1 = sha256_Transform(in, state2);
	//		state2 = H256;
	in.lo = state1;
	in.hi = pad4;
	in.sf = 0x100;
	res = sha256_Transform(in, H256);


	if (SWAP32(res.s7) <= (target)) 
		output[atomic_inc(output + 0xFF)] = (nonce);
	
}
