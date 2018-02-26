# OPM-Mine

# OpenEthMine官网:http://openethmine.com

# 介绍
我们决定开放我们的以太坊混合采矿实施。它只关心工作分配和共享验证; 有效份额存储在本地数据库（LevelDB）中。

# 性能
尽管目前的实施可能不是最有效的方法，但该池能够以30％CPU利用率（1核）和70MB RAM使用率处理大约600名员工。

# 支持的客户端
该池已经与Ethereum客户端（geth）和cpp以太坊客户端（eth）成功进行了测试。

# 请求与优化
如果您发现游泳池软件存在任何问题，请随时发出拉取请求。

如果你想改进池，通过IPC实现连接而不是HTTP将是一个好的开始。

# 安装指南（Ubuntu 14.04）
按照https://github.com/ethereum/go-ethereum/wiki/Installing-Go#ubuntu-1404安装
将pool.go文件放入你的gopath中
运行去下载依赖关系
调整端口以匹配您的环境（poolPort和ethereumPort）
启动您的Ethereum客户端并启用RPC
运行go build pool.go
启动池服务器./pool
将你的矿工指向http：// ip：port / miner / \ <account>。<worker> / <hashrate>


# Performance
While the current implementation in go might not be the most effective one, the pool was able to process ~600 workers at 30% CPU utilization (1 core) and 70MB RAM usage.

# Supported clients
The pool has been tested successfully with both the go Ethereum client (geth) and the cpp Ethereum client (eth).

# Pull requests & possible optimizations
If you find any issues with the pool software please feel free to issue a pull request.

If you want to improve the pool, implementing the connection to geth via IPC instead of HTTP would be a good start.

# Setup guide (Ubuntu 14.04)
* Install go according to https://github.com/ethereum/go-ethereum/wiki/Installing-Go#ubuntu-1404
* Put the pool.go file into your gopath
* Run go get to download the dependencies
* Adjust the ports to match your environment (poolPort and ethereumPort)
* Start your Ethereum client & enable RPC
* Run go build pool.go
* Start the pool server ./pool
* Point your miner to http://ip:port/miner/\<account\>.\<worker\>/\<hashrate\>

# 哈希码

__constant static const sph_u32 T256[32][8] = {
	{ SPH_C32(0x74951000), SPH_C32(0x5a2b467e), SPH_C32(0x88fd1d2b),
	  SPH_C32(0x1ee68292), SPH_C32(0xcba90000), SPH_C32(0x90273769),
	  SPH_C32(0xbbdcf407), SPH_C32(0xd0f4af61) },
	{ SPH_C32(0xcba90000), SPH_C32(0x90273769), SPH_C32(0xbbdcf407),
	  SPH_C32(0xd0f4af61), SPH_C32(0xbf3c1000), SPH_C32(0xca0c7117),
	  SPH_C32(0x3321e92c), SPH_C32(0xce122df3) },
	{ SPH_C32(0xe92a2000), SPH_C32(0xb4578cfc), SPH_C32(0x11fa3a57),
	  SPH_C32(0x3dc90524), SPH_C32(0x97530000), SPH_C32(0x204f6ed3),
	  SPH_C32(0x77b9e80f), SPH_C32(0xa1ec5ec1) },
	{ SPH_C32(0x97530000), SPH_C32(0x204f6ed3), SPH_C32(0x77b9e80f),
	  SPH_C32(0xa1ec5ec1), SPH_C32(0x7e792000), SPH_C32(0x9418e22f),
	  SPH_C32(0x6643d258), SPH_C32(0x9c255be5) },
	{ SPH_C32(0x121b4000), SPH_C32(0x5b17d9e8), SPH_C32(0x8dfacfab),
	  SPH_C32(0xce36cc72), SPH_C32(0xe6570000), SPH_C32(0x4bb33a25),
	  SPH_C32(0x848598ba), SPH_C32(0x1041003e) },
	{ SPH_C32(0xe6570000), SPH_C32(0x4bb33a25), SPH_C32(0x848598ba),
	  SPH_C32(0x1041003e), SPH_C32(0xf44c4000), SPH_C32(0x10a4e3cd),
	  SPH_C32(0x097f5711), SPH_C32(0xde77cc4c) },
	{ SPH_C32(0xe4788000), SPH_C32(0x859673c1), SPH_C32(0xb5fb2452),
	  SPH_C32(0x29cc5edf), SPH_C32(0x045f0000), SPH_C32(0x9c4a93c9),
	  SPH_C32(0x62fc79d0), SPH_C32(0x731ebdc2) },
	{ SPH_C32(0x045f0000), SPH_C32(0x9c4a93c9), SPH_C32(0x62fc79d0),
	  SPH_C32(0x731ebdc2), SPH_C32(0xe0278000), SPH_C32(0x19dce008),
	  SPH_C32(0xd7075d82), SPH_C32(0x5ad2e31d) },
	{ SPH_C32(0xb7a40100), SPH_C32(0x8a1f31d8), SPH_C32(0x8589d8ab),
	  SPH_C32(0xe6c46464), SPH_C32(0x734c0000), SPH_C32(0x956fa7d6),
	  SPH_C32(0xa29d1297), SPH_C32(0x6ee56854) },
	{ SPH_C32(0x734c0000), SPH_C32(0x956fa7d6), SPH_C32(0xa29d1297),
	  SPH_C32(0x6ee56854), SPH_C32(0xc4e80100), SPH_C32(0x1f70960e),
	  SPH_C32(0x2714ca3c), SPH_C32(0x88210c30) },
	{ SPH_C32(0xa7b80200), SPH_C32(0x1f128433), SPH_C32(0x60e5f9f2),
	  SPH_C32(0x9e147576), SPH_C32(0xee260000), SPH_C32(0x124b683e),
	  SPH_C32(0x80c2d68f), SPH_C32(0x3bf3ab2c) },
	{ SPH_C32(0xee260000), SPH_C32(0x124b683e), SPH_C32(0x80c2d68f),
	  SPH_C32(0x3bf3ab2c), SPH_C32(0x499e0200), SPH_C32(0x0d59ec0d),
	  SPH_C32(0xe0272f7d), SPH_C32(0xa5e7de5a) },
	{ SPH_C32(0x8f3e0400), SPH_C32(0x0d9dc877), SPH_C32(0x6fc548e1),
	  SPH_C32(0x898d2cd6), SPH_C32(0x14bd0000), SPH_C32(0x2fba37ff),
	  SPH_C32(0x6a72e5bb), SPH_C32(0x247febe6) },
	{ SPH_C32(0x14bd0000), SPH_C32(0x2fba37ff), SPH_C32(0x6a72e5bb),
	  SPH_C32(0x247febe6), SPH_C32(0x9b830400), SPH_C32(0x2227ff88),
	  SPH_C32(0x05b7ad5a), SPH_C32(0xadf2c730) },
	{ SPH_C32(0xde320800), SPH_C32(0x288350fe), SPH_C32(0x71852ac7),
	  SPH_C32(0xa6bf9f96), SPH_C32(0xe18b0000), SPH_C32(0x5459887d),
	  SPH_C32(0xbf1283d3), SPH_C32(0x1b666a73) },
	{ SPH_C32(0xe18b0000), SPH_C32(0x5459887d), SPH_C32(0xbf1283d3),
	  SPH_C32(0x1b666a73), SPH_C32(0x3fb90800), SPH_C32(0x7cdad883),
	  SPH_C32(0xce97a914), SPH_C32(0xbdd9f5e5) },
	{ SPH_C32(0x515c0010), SPH_C32(0x40f372fb), SPH_C32(0xfce72602),
	  SPH_C32(0x71575061), SPH_C32(0x2e390000), SPH_C32(0x64dd6689),
	  SPH_C32(0x3cd406fc), SPH_C32(0xb1f490bc) },
	{ SPH_C32(0x2e390000), SPH_C32(0x64dd6689), SPH_C32(0x3cd406fc),
	  SPH_C32(0xb1f490bc), SPH_C32(0x7f650010), SPH_C32(0x242e1472),
	  SPH_C32(0xc03320fe), SPH_C32(0xc0a3c0dd) },
	{ SPH_C32(0xa2b80020), SPH_C32(0x81e7e5f6), SPH_C32(0xf9ce4c04),
	  SPH_C32(0xe2afa0c0), SPH_C32(0x5c720000), SPH_C32(0xc9bacd12),
	  SPH_C32(0x79a90df9), SPH_C32(0x63e92178) },
	{ SPH_C32(0x5c720000), SPH_C32(0xc9bacd12), SPH_C32(0x79a90df9),
	  SPH_C32(0x63e92178), SPH_C32(0xfeca0020), SPH_C32(0x485d28e4),
	  SPH_C32(0x806741fd), SPH_C32(0x814681b8) },
	{ SPH_C32(0x4dce0040), SPH_C32(0x3b5bec7e), SPH_C32(0x36656ba8),
	  SPH_C32(0x23633a05), SPH_C32(0x78ab0000), SPH_C32(0xa0cd5a34),
	  SPH_C32(0x5d5ca0f7), SPH_C32(0x727784cb) },
	{ SPH_C32(0x78ab0000), SPH_C32(0xa0cd5a34), SPH_C32(0x5d5ca0f7),
	  SPH_C32(0x727784cb), SPH_C32(0x35650040), SPH_C32(0x9b96b64a),
	  SPH_C32(0x6b39cb5f), SPH_C32(0x5114bece) },
	{ SPH_C32(0x5bd20080), SPH_C32(0x450f18ec), SPH_C32(0xc2c46c55),
	  SPH_C32(0xf362b233), SPH_C32(0x39a60000), SPH_C32(0x4ab753eb),
	  SPH_C32(0xd14e094b), SPH_C32(0xb772b42b) },
	{ SPH_C32(0x39a60000), SPH_C32(0x4ab753eb), SPH_C32(0xd14e094b),
	  SPH_C32(0xb772b42b), SPH_C32(0x62740080), SPH_C32(0x0fb84b07),
	  SPH_C32(0x138a651e), SPH_C32(0x44100618) },
	{ SPH_C32(0xc04e0001), SPH_C32(0x33b9c010), SPH_C32(0xae0ebb05),
	  SPH_C32(0xb5a4c63b), SPH_C32(0xc8f10000), SPH_C32(0x0b2de782),
	  SPH_C32(0x6bf648a4), SPH_C32(0x539cbdbf) },
	{ SPH_C32(0xc8f10000), SPH_C32(0x0b2de782), SPH_C32(0x6bf648a4),
	  SPH_C32(0x539cbdbf), SPH_C32(0x08bf0001), SPH_C32(0x38942792),
	  SPH_C32(0xc5f8f3a1), SPH_C32(0xe6387b84) },
	{ SPH_C32(0x88230002), SPH_C32(0x5fe7a7b3), SPH_C32(0x99e585aa),
	  SPH_C32(0x8d75f7f1), SPH_C32(0x51ac0000), SPH_C32(0x25e30f14),
	  SPH_C32(0x79e22a4c), SPH_C32(0x1298bd46) },
	{ SPH_C32(0x51ac0000), SPH_C32(0x25e30f14), SPH_C32(0x79e22a4c),
	  SPH_C32(0x1298bd46), SPH_C32(0xd98f0002), SPH_C32(0x7a04a8a7),
	  SPH_C32(0xe007afe6), SPH_C32(0x9fed4ab7) },
	{ SPH_C32(0xd0080004), SPH_C32(0x8c768f77), SPH_C32(0x9dc5b050),
	  SPH_C32(0xaf4a29da), SPH_C32(0x6ba90000), SPH_C32(0x40ebf9aa),
	  SPH_C32(0x98321c3d), SPH_C32(0x76acc733) },
	{ SPH_C32(0x6ba90000), SPH_C32(0x40ebf9aa), SPH_C32(0x98321c3d),
	  SPH_C32(0x76acc733), SPH_C32(0xbba10004), SPH_C32(0xcc9d76dd),
	  SPH_C32(0x05f7ac6d), SPH_C32(0xd9e6eee9) },
	{ SPH_C32(0xa8ae0008), SPH_C32(0x2079397d), SPH_C32(0xfe739301),
	  SPH_C32(0xb8a92831), SPH_C32(0x171c0000), SPH_C32(0xb26e3344),
	  SPH_C32(0x9e6a837e), SPH_C32(0x58f8485f) },
	{ SPH_C32(0x171c0000), SPH_C32(0xb26e3344), SPH_C32(0x9e6a837e),
	  SPH_C32(0x58f8485f), SPH_C32(0xbfb20008), SPH_C32(0x92170a39),
	  SPH_C32(0x6019107f), SPH_C32(0xe051606e) }
};

#define INPUT_SMALL   do { \
		__constant const sph_u32 *tp = &T256[0][0]; \
		unsigned u, v; \
		m0 = 0; \
		m1 = 0; \
		m2 = 0; \
		m3 = 0; \
		m4 = 0; \
		m5 = 0; \
		m6 = 0; \
		m7 = 0; \
		for (u = 0; u < 4; u ++) { \
			unsigned db = buf(u); \
			for (v = 0; v < 8; v ++, db >>= 1) { \
				sph_u32 dm = SPH_T32(-(sph_u32)(db & 1)); \
				m0 ^= dm & *tp ++; \
				m1 ^= dm & *tp ++; \
				m2 ^= dm & *tp ++; \
				m3 ^= dm & *tp ++; \
				m4 ^= dm & *tp ++; \
				m5 ^= dm & *tp ++; \
				m6 ^= dm & *tp ++; \
				m7 ^= dm & *tp ++; \
			} \
		} \
	} while (0)

#endif

#if SPH_HAMSI_EXPAND_SMALL == 2

__constant static const sph_u32 T256_0[4][8] = {
	{ SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000) },
	{ SPH_C32(0xe4788000), SPH_C32(0x859673c1), SPH_C32(0xb5fb2452),
	  SPH_C32(0x29cc5edf), SPH_C32(0x045f0000), SPH_C32(0x9c4a93c9),
	  SPH_C32(0x62fc79d0), SPH_C32(0x731ebdc2) },
	{ SPH_C32(0x045f0000), SPH_C32(0x9c4a93c9), SPH_C32(0x62fc79d0),
	  SPH_C32(0x731ebdc2), SPH_C32(0xe0278000), SPH_C32(0x19dce008),
	  SPH_C32(0xd7075d82), SPH_C32(0x5ad2e31d) },
	{ SPH_C32(0xe0278000), SPH_C32(0x19dce008), SPH_C32(0xd7075d82),
	  SPH_C32(0x5ad2e31d), SPH_C32(0xe4788000), SPH_C32(0x859673c1),
	  SPH_C32(0xb5fb2452), SPH_C32(0x29cc5edf) }
};

__constant static const sph_u32 T256_2[4][8] = {
	{ SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000) },
	{ SPH_C32(0x121b4000), SPH_C32(0x5b17d9e8), SPH_C32(0x8dfacfab),
	  SPH_C32(0xce36cc72), SPH_C32(0xe6570000), SPH_C32(0x4bb33a25),
	  SPH_C32(0x848598ba), SPH_C32(0x1041003e) },
	{ SPH_C32(0xe6570000), SPH_C32(0x4bb33a25), SPH_C32(0x848598ba),
	  SPH_C32(0x1041003e), SPH_C32(0xf44c4000), SPH_C32(0x10a4e3cd),
	  SPH_C32(0x097f5711), SPH_C32(0xde77cc4c) },
	{ SPH_C32(0xf44c4000), SPH_C32(0x10a4e3cd), SPH_C32(0x097f5711),
	  SPH_C32(0xde77cc4c), SPH_C32(0x121b4000), SPH_C32(0x5b17d9e8),
	  SPH_C32(0x8dfacfab), SPH_C32(0xce36cc72) }
};

__constant static const sph_u32 T256_4[4][8] = {
	{ SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000) },
	{ SPH_C32(0xe92a2000), SPH_C32(0xb4578cfc), SPH_C32(0x11fa3a57),
	  SPH_C32(0x3dc90524), SPH_C32(0x97530000), SPH_C32(0x204f6ed3),
	  SPH_C32(0x77b9e80f), SPH_C32(0xa1ec5ec1) },
	{ SPH_C32(0x97530000), SPH_C32(0x204f6ed3), SPH_C32(0x77b9e80f),
	  SPH_C32(0xa1ec5ec1), SPH_C32(0x7e792000), SPH_C32(0x9418e22f),
	  SPH_C32(0x6643d258), SPH_C32(0x9c255be5) },
	{ SPH_C32(0x7e792000), SPH_C32(0x9418e22f), SPH_C32(0x6643d258),
	  SPH_C32(0x9c255be5), SPH_C32(0xe92a2000), SPH_C32(0xb4578cfc),
	  SPH_C32(0x11fa3a57), SPH_C32(0x3dc90524) }
};

__constant static const sph_u32 T256_6[4][8] = {
	{ SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000) },
	{ SPH_C32(0x74951000), SPH_C32(0x5a2b467e), SPH_C32(0x88fd1d2b),
	  SPH_C32(0x1ee68292), SPH_C32(0xcba90000), SPH_C32(0x90273769),
	  SPH_C32(0xbbdcf407), SPH_C32(0xd0f4af61) },
	{ SPH_C32(0xcba90000), SPH_C32(0x90273769), SPH_C32(0xbbdcf407),
	  SPH_C32(0xd0f4af61), SPH_C32(0xbf3c1000), SPH_C32(0xca0c7117),
	  SPH_C32(0x3321e92c), SPH_C32(0xce122df3) },
	{ SPH_C32(0xbf3c1000), SPH_C32(0xca0c7117), SPH_C32(0x3321e92c),
	  SPH_C32(0xce122df3), SPH_C32(0x74951000), SPH_C32(0x5a2b467e),
	  SPH_C32(0x88fd1d2b), SPH_C32(0x1ee68292) }
};

__constant static const sph_u32 T256_8[4][8] = {
	{ SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000) },
	{ SPH_C32(0xde320800), SPH_C32(0x288350fe), SPH_C32(0x71852ac7),
	  SPH_C32(0xa6bf9f96), SPH_C32(0xe18b0000), SPH_C32(0x5459887d),
	  SPH_C32(0xbf1283d3), SPH_C32(0x1b666a73) },
	{ SPH_C32(0xe18b0000), SPH_C32(0x5459887d), SPH_C32(0xbf1283d3),
	  SPH_C32(0x1b666a73), SPH_C32(0x3fb90800), SPH_C32(0x7cdad883),
	  SPH_C32(0xce97a914), SPH_C32(0xbdd9f5e5) },
	{ SPH_C32(0x3fb90800), SPH_C32(0x7cdad883), SPH_C32(0xce97a914),
	  SPH_C32(0xbdd9f5e5), SPH_C32(0xde320800), SPH_C32(0x288350fe),
	  SPH_C32(0x71852ac7), SPH_C32(0xa6bf9f96) }
};

__constant static const sph_u32 T256_10[4][8] = {
	{ SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000) },
	{ SPH_C32(0x8f3e0400), SPH_C32(0x0d9dc877), SPH_C32(0x6fc548e1),
	  SPH_C32(0x898d2cd6), SPH_C32(0x14bd0000), SPH_C32(0x2fba37ff),
	  SPH_C32(0x6a72e5bb), SPH_C32(0x247febe6) },
	{ SPH_C32(0x14bd0000), SPH_C32(0x2fba37ff), SPH_C32(0x6a72e5bb),
	  SPH_C32(0x247febe6), SPH_C32(0x9b830400), SPH_C32(0x2227ff88),
	  SPH_C32(0x05b7ad5a), SPH_C32(0xadf2c730) },
	{ SPH_C32(0x9b830400), SPH_C32(0x2227ff88), SPH_C32(0x05b7ad5a),
	  SPH_C32(0xadf2c730), SPH_C32(0x8f3e0400), SPH_C32(0x0d9dc877),
	  SPH_C32(0x6fc548e1), SPH_C32(0x898d2cd6) }
};

__constant static const sph_u32 T256_12[4][8] = {
	{ SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000), SPH_C32(0x00000000),
	  SPH_C32(0x00000000), SPH_C32(0x00000000) },
	{ SPH_C32(0xa7b80200), SPH_C32(0x1f128433), SPH_C32(0x60e5f9f2),
	  SPH_C32(0x9e147576), SPH_C32(0xee260000), SPH_C32(0x124b683e),
	  SPH_C32(0x80c2d68f), SPH_C32(0x3bf3ab2c) },
	{ SPH_C32(0xee260000), SPH_C32(0x124b683e), SPH_C32(0x80c2d68f),
	  SPH_C32(0x3bf3ab2c), SPH_C32(0x499e0200), SPH_C32(0x0d59ec0d),
	  SPH_C32(0xe0272f7d), SPH_C32(0xa5e7de5a) },
	{ SPH_C32(0x499e0200), SPH_C32(0x0d59ec0d), SPH_C32(0xe0272f7d),
	  SPH_C32(0xa5e7de5a), SPH_C32(0xa7b80200), SPH_C32(0x1f128433),
	  SPH_C32(0x60e5f9f2), SPH_C32(0x9e147576) }
};
