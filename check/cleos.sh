#!/bin/bash
#docker exec eosio-nodeos sh -c "cleos -u http://127.0.0.1:8886 $*"
sh -c "cleos -u http://127.0.0.1:8810 $*"

