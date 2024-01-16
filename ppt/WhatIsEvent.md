# What is Event logs on blockchain

**Log System Help US:**

1. Debug
2. Notify
3. Compliance

![](https://img.learnblockchain.cn/learn202312202147090.png)

## Logging on Ethereum

### On EVM

Generate a log record during logging operations.

[Ethereum Yellowpaper ](https://ethereum.github.io/yellowpaper/paper.pdf)

![Logging Operations](https://img.learnblockchain.cn/learn202312202200303.png)


### On Solidity

```solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;
contract EventExample {
    
    event Transfer(address indexed from, address indexed to, uint256 value); // 1️⃣

    mapping(address => uint256) public balances;

    function transfer(address to, uint256 amount) external {
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount); // 2️⃣
    }

    function mint() external {
        balances[msg.sender] += 100;
        emit Transfer(address(0), msg.sender, 100); //3️⃣
    }
}
```

- 1️⃣ Define event struct
- 2️⃣ Emit event (exec log2)
- 3️⃣ Emit event (exec log2)

### On Node

Log records are stored on the Ethereum blockchain node server.

[eth_getlogs](https://docs.infura.io/networks/ethereum/json-rpc-methods/eth_getlogs)、[example]( https://etherscan.io/address/0xdac17f958d2ee523a2206206994597c13d831ec7#events)

Event Record

- `address`: the address of the contract (intrinsically provided by Ethereum);
- `topics[0]`: `keccak(EVENT_NAME+"("+EVENT_ARGS.map(canonical_type_of).join(",")+")")` (`canonical_type_of` is a function that simply returns the canonical type of a given argument, e.g. for `uint indexed foo`, it would return `uint256`). This value is only present in `topics[0]` if the event is not declared as `anonymous`;
- `topics[n]`: `abi_encode(EVENT_INDEXED_ARGS[n - 1])` if the event is not declared as `anonymous` or `abi_encode(EVENT_INDEXED_ARGS[n])` if it is (`EVENT_INDEXED_ARGS` is the series of `EVENT_ARGS` that are indexed);
- `data`: **ABI** encoding of `EVENT_NON_INDEXED_ARGS` (`EVENT_NON_INDEXED_ARGS` is the series of `EVENT_ARGS` that are not indexed, `abi_encode` is the ABI encoding function used for returning a series of typed values from a function, as described above).

## Exercise

What does this log tell us about what happened?

```json
{
  "address":"0x33fd426905f149f8376e227d0c9d3340aad17af1",
  "topics":["0xc3d58168c5ae7397731d063d5bbf3d657854427343f4c083240f7aacaa2d0f62","0x0000000000000000000000001e0049783f008a0085193e00003d00cd54003c71","0x000000000000000000000000111818a51c4177e8980566beea68fe334be7b76a","0x00000000000000000000000091aa2610067019cb9930106d1fae7998ba1e73ee"], "data":"0x000000000000000000000000000000000000000000000000000000000000003c0000000000000000000000000000000000000000000000000000000000000001",
  "blockHash":"...",
  "blockNumber":"...",
  "transactionHash":"...",
  "transactionIndex":"0x7f",
  "logIndex":"0x22e",
  "removed":false
}
```

