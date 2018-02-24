# OPM-Mine

官网:http://openethmine.com

介绍
我们决定开放我们的以太坊混合采矿实施。它只关心工作分配和共享验证; 有效份额存储在本地数据库（LevelDB）中。

性能
尽管目前的实施可能不是最有效的方法，但该池能够以30％CPU利用率（1核）和70MB RAM使用率处理大约600名员工。

支持的客户端
该池已经与Ethereum客户端（geth）和cpp以太坊客户端（eth）成功进行了测试。

拉取请求和可能的优化
如果您发现游泳池软件存在任何问题，请随时发出拉取请求。

如果你想改进池，通过IPC实现连接而不是HTTP将是一个好的开始。

安装指南（Ubuntu 14.04）
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
