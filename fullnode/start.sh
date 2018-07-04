#!/bin/bash

kill `cat nodeos.pid`

rm -rf nodeos/data
rm -rf /root/eosio-wallet/./default.wallet
#docker stop eosio-nodeos
#docker rm eosio-nodeos
#docker run -ti --detach --name eosio-nodeos -p 8889:8889 -p 9877:9877 -v `pwd`:/root/.local/share/eosio eosio/eos:v1.0.0 /opt/eosio/bin/nodeos  --genesis-json=/root/.local/share/eosio/nodeos/config/genesis.json


nohup nodeos --data-dir `pwd`/nodeos/data --genesis-json=`pwd`/nodeos/config/genesis.json --config-dir `pwd`/nodeos/config & echo $! >nodeos.pid
