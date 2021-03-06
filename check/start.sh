#!/bin/bash

kill `cat nodeos.pid`

rm -rf nodeos/data
rm -rf /root/eosio-wallet/check.wallet

#mkdir -p ./contracts/eosio.disco
#wget -O ./contracts/eosio.disco/eosio.disco.abi https://ipfs.io/ipfs/QmYzxhhE9f9aZTV7rqqYSNQy9pZVKk2pur9ccRZfY7yfs9
#wget -O ./contracts/eosio.disco/eosio.disco.wasm https://ipfs.io/ipfs/QmUNo5jMFn1BqT8msuw7ZtW37d1FP2PJSeWu7fDQ7H4Syn
#mkdir -p ./contracts/eosio.unregd
#wget -O ./contracts/eosio.unregd/eosio.unregd.abi https://ipfs.io/ipfs/QmfTP1RDACUHUB95pYDzmtowNovjvqkt9caVdtSQ69QFyK
#wget -O ./contracts/eosio.unregd/eosio.unregd.wasm https://ipfs.io/ipfs/QmPYfn1bniet9NYjeSvyDWNvJie6Xad7uSYjydpsK4VwuP

sleep 1
nohup nodeos --data-dir `pwd`/nodeos/data --genesis-json=`pwd`/nodeos/config/genesis.json --config-dir `pwd`/nodeos/config & echo $! >nodeos.pid

sleep 3

./cleos.sh wallet create  -n check

./cleos.sh wallet import -n check  5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

for name in msig token disco bios ram ramfee names stake saving bpay vpay unregd
do
  ./cleos.sh create account eosio eosio.$name EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
done

for name in msig token 
do
  ./cleos.sh set contract eosio.$name /root/eosio/eos/build/contracts/eosio.$name
done

#for name in  disco unregd
#do
 # ./cleos.sh set contract eosio.$name ./contracts/eosio.$name
#done
 

./cleos.sh  push action eosio.token create "'[\"eosio\",\"1000000000.0000 EOS\",0,0,0]'" -p eosio.token
./cleos.sh  push action eosio.token issue "'[\"eosio\",\"1000000000.0000 EOS\",\"issue\"]'" -p eosio

#./cleos.sh  push action eosio.token create "'[\"eosio\",\"1000000000.0000 SYS\",0,0,0]'" -p eosio.token
#./cleos.sh  push action eosio.token issue "'[\"eosio\",\"1000000000.0000 SYS\",\"issue\"]'" -p eosio

./cleos.sh set contract eosio /root/eosio/eos/build/contracts/eosio.system -x 3600

sleep 3

echo ----------Code List--------------
echo -n "eosio "
./cleos.sh get code eosio | grep -oE '\w+$'


for name in msig token disco bios ram ramfee names stake saving bpay vpay unregd
do
  echo -n "eosio.$name "
  ./cleos.sh get code eosio.$name | grep -oE '\w+$'
done
