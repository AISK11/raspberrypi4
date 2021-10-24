#!/bin/bash

## Activation to be able to see balance:
cd ${HOME}/chia-blockchain
. ./activate
cd chia

## Get chia wallet balance:
BALANCE=$(chia wallet show | grep "Total Balance:" | head -n 1 | cut -d ' ' -f 6)

## Get data from the internet:
CHIA_PRICE=$(curl -s 'https://www.livecoinwatch.com/price/Chia-XCH' | egrep -o '"price":.*,"highPrice"' | cut -d ',' -f 1 | cut -d ':' -f 2)
USD_TO_EUR=$(curl -s 'https://wise.com/us/currency-converter/usd-to-eur-rate' | egrep -o '"text-success">.*</span>' | head -n 1 | cut -d '>' -f 2 | cut -d '<' -f 1)

if [[ -z ${BALANCE} ]] || [[ -z ${CHIA_PRICE} ]] || [[ -z ${USD_TO_EUR} ]]; then
    echo "Error!"
else
    #echo "${BALANCE} * ${CHIA_PRICE} * ${USD_TO_EUR}"
    EUR=$(python3 -c "print(${BALANCE} * ${CHIA_PRICE} * ${USD_TO_EUR})")
    echo "${EUR} EUR"
fi
