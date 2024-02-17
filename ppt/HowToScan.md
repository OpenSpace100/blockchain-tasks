# 01.How to scan on-chain data

![tokens](https://img.learnblockchain.cn/learn202312202132080.png)

## Point

 KeyValue: On-chain data  ---->  SQL： Relational database

## How to read on-chain data?

1. Real-time data: 
   1. Call contract functions: e.g. Read Alice's deposit balance
2. History data: 
   1. Parsing Transaction Events: e.g. Keep a record of all deposits
   2. Call contract functions with block number
   3. Subscription Events

## Key RPC APIs

1. [eth_call](https://ethereum.org/en/developers/docs/apis/json-rpc#eth_call)
2. [eth_getlogs](https://ethereum.org/en/developers/docs/apis/json-rpc#eth_getlogs)
3. [eth_gettransactionreceipt](https://ethereum.org/en/developers/docs/apis/json-rpc#eth_gettransactionreceipt)
4. Eth_balance

## Example

1. Show all deposits/withdraw records

