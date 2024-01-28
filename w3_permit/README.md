## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Install Dep
```
forge install OpenZeppelin/openzeppelin-contracts
```

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript -f <your_rpc_url> --private-key <your_private_key>

$ forge script script/xxx.sol -f local --broadcast

$ forge script script/TokenBank.s.sol  --broadcast -f http://127.0.0.1:8545
```

for upgrade:

```
forge script script/Counter.s.sol --broadcast --ffi -f local

forge script script/CounterV2.s.sol --broadcast --ffi -f local --sender <ADDRESS>


```



### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
