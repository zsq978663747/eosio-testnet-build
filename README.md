# eosio-testnet-build
build  eosio-testnet

1.创建eosio文件，从git上获取eos代码，编译

2.cd check，根据自己的需要修改start.sh脚本，启动eosio程序，并且部署好合约；config配置文件在nodeos/config/config.ini  genesis.json;block 数据也在nodeos/data下面，会自动生成。

想要生成账户的时候可以执行下面
```
eosio：
./cleos.sh system newaccount --stake-net "100000000.0000 EOS" --stake-cpu "100000000.0000 EOS" --buy-ram "2.0000 EOS"  eosio eosstore2222  EOS6sP6gye24nbDYSthYNrrhzpwgTxBqGqNSgMrc7sk3cGR13kSZc  EOS7XJouR3hFbdp9Ym9SqyzEHM4ymhJTFUKLWvnK7DTNJW7BNG9hd  -p  eosio --transfer

./cleos.sh system newaccount --stake-net \"4.0000 EOS\" --stake-cpu \"4.0000 EOS\" --buy-ram \"2.0000 EOS\"  eosio eosstore2225  EOS7Uxvk76epeD5ypZ4ZAxJnrZDCV94LcsEssGJWPS7tDMY7Fbd95   

./cleos.sh transfer eosio eosstore2222 \"200000000 EOS\"
```
3.部署bp节点可以运行test/下的start.sh

```
 ./cleos.sh system regproducer  eosstore2225 EOS7Uxvk76epeD5ypZ4ZAxJnrZDCV94LcsEssGJWPS7tDMY7Fbd95  http://www.eos.store 900
 ./cleos.sh system regproducer  eosstore2222 EOS69ESadBb1i4Hi6Sb43bsygevjzaTpnmVW8bzQBQy4CCgbzfmrm  http://XXXwww.com 700

 ./cleos.sh system voteproducer prods eosstore2222 eosstore2222 eosstore2225
```

4.部署全节点可以运行fullnode/下的start.sh

