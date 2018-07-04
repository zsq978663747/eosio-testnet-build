# eosio-testnet-build
build  eosio-testnet
1.创建eosio文件，从git上获取eos代码，编译

2.cd check，根据自己的需要修改start.sh脚本，启动eosio程序，并且部署好合约；config配置文件在nodeos/config/config.ini  genesis.json;block 数据也在nodeos/data下面，会自动生成。

3.部署bp节点可以运行test/下的start.sh

4.部署全节点可以运行fullnode/下的start.sh

