# How to write unit tests for Solidity

## Content 

1. Introduction To testing
2. Foundry Cheatcodes
3. Fork Testing
4. Fuzz Testing
5. Invariant Testing
6. Differential Testing

## Introduction To testing

### Example

```solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
    function testFail() public{
        counter.setNumber(type(uint256).max);
        
    }
}
```

**Key points:**

1. Line4:  Import  the `Test` contract;
2. line7:  Inheriting the ` Test` Contract;
3. line10:  An optional function `setUp` invoked before each test case is run;
4. line15: `test`: Functions prefixed with `test` are run as a test case;
5. line20: `testFail`: The inverse of the `test` prefix - if the function does not revert, the test fails.

### Run test

```cmd
forge test --summary
[⠒] Compiling...
No files changed, compilation skipped

Running 2 tests for test/Counter.t.sol:CounterTest
[PASS] testFuzz_SetNumber(uint256) (runs: 256, μ: 27553, ~: 28409)
[PASS] test_Increment() (gas: 28379)
Test result: ok. 2 passed; 0 failed; 0 skipped; finished in 44.46ms
 
Ran 1 test suites: 2 tests passed, 0 failed, 0 skipped (2 total tests)


Test Summary:

╭-------------+--------+--------+---------╮
|  Test Suite | Passed | Failed | Skipped |
+=========================================+
| CounterTest |    2   |    0   |    0    |
╰-------------+--------+--------+---------╯
```

[Test config](https://book.getfoundry.sh/reference/config/testing)

```tex
Usage: forge test [OPTIONS]

Options:
  -h, --help  Print help (see more with '--help')

Test options:
      --debug <TEST_FUNCTION>    Run a test in the debugger
      --gas-report               Print a gas report [env: FORGE_GAS_REPORT=]
      --allow-failure            Exit with code 0 even if a test fails [env: FORGE_ALLOW_FAILURE=]
      --fail-fast                Stop running tests after the first failure
      --etherscan-api-key <KEY>   
      --fuzz-seed <FUZZ_SEED>    Set seed used to generate randomness during your fuzz runs
      --fuzz-runs <RUNS>         [env: FOUNDRY_FUZZ_RUNS=]

Display options:
  -j, --json      Output test results in JSON format
  -l, --list      List tests instead of running them
      --summary   Print test summary table
      --detailed  Print detailed test summary table

Test filtering:
      --match-test <REGEX>         Only run test functions matching the specified regex pattern [aliases: mt]
      --no-match-test <REGEX>      Only run test functions that do not match the specified regex pattern [aliases: nmt]
      --match-contract <REGEX>     Only run tests in contracts matching the specified regex pattern [aliases: mc]
      --no-match-contract <REGEX>  Only run tests in contracts that do not match the specified regex pattern [aliases: nmc]
      --match-path <GLOB>          Only run tests in source files matching the specified glob pattern [aliases: mp]
      --no-match-path <GLOB>       Only run tests in source files that do not match the specified glob pattern [aliases: nmp]


Watch options:
  -w, --watch [<PATH>...]    Watch the given files or directories for changes
      --no-restart           Do not restart the command while it's still running
      --run-all              Explicitly re-run all tests when a change is made
      --watch-delay <DELAY>  File update debounce delay
```



### Exercises01

1. ❓How to call contract with  Bob wallet?
2. ❓How to reset and get Bob's ETH balance?
3. ❓How to change block number or block timestamp?
4. ❓How to check revert message ?
5. ❓How to check event data?

Cheatcodes give you powerful assertions, the ability to alter the state of the EVM, mock data, and more.

 https://book.getfoundry.sh/cheatcodes/ 

## Foundry Cheatcodes's Power

Foundry gives you **complete** **control** !

- [Std Logs](https://book.getfoundry.sh/reference/forge-std/std-logs.html): Expand upon the logging events from the DSTest library. 
- [Std Assertions](https://book.getfoundry.sh/reference/forge-std/std-assertions.html): Expand upon the assertion functions from the DSTest library.
- [Std Cheats](https://book.getfoundry.sh/reference/forge-std/std-cheats.html): Wrappers around Forge cheatcodes for improved safety and DX.
- [Std Errors](https://book.getfoundry.sh/reference/forge-std/std-errors.html): Wrappers around common internal Solidity errors and reverts.
- [Std Storage](https://book.getfoundry.sh/reference/forge-std/std-storage.html): Utilities for storage manipulation.
- [Std Math](https://book.getfoundry.sh/reference/forge-std/std-math.html): Useful mathematical functions.
- [Script Utils](https://book.getfoundry.sh/reference/forge-std/script-utils.html): Utility functions which can be accessed in tests and scripts.
- [Console Logging](https://book.getfoundry.sh/reference/forge-std/console-log.html): Console logging functions.

```solidity

    function testStd() public {
        address alice = makeAddr("alice");
        // Log with the Hardhat `console` (`console2`)
        console.log("Alice:", alice);
        // output: Alice: 0x328809Bc894f92807417D2dAD6b7C998c1aFdac6

        // Assert and log using Dappsys Test
        assertEq(token.balanceOf(alice), 0, "expect alice balance is zero");

        emit log_named_uint("Amount:", 1 ether);
        //output: Amount: 1000000000000000000

        // Use the alternative signature for ERC20 tokens
        deal(address(token), alice, 10000e18);
        // check that alice has 10000 tokens
        assertEq(token.balanceOf(alice), 10000e18);

        // Returns the difference between two numbers in percentage, where 1e18 is 100%.
        uint256 delta = stdMath.percentDelta(uint256(102), 100);
        assertEq(delta, 0.02 * 1e18, "expect diff == 0.02");

        // Use utils
        address nonce1Addr = vm.computeCreateAddress(alice, 1);
        console.log("Nonce1 addr:", nonce1Addr);
        // output: Nonce1 addr: 0x9c1eF3D4c320eC7ecF88c8e8a8f47DB2af5c69b8

        // Sets all subsequent calls' msg.sender to alice until `stopPrank` is called
        vm.startPrank(alice);
        new MockERC20(); // nonce = 0
        MockERC20 token1 = new MockERC20(); // nonce=1
        assertEq(nonce1Addr, address(token1));
    }
```



## Fork Testing

❓ Why need a forked environment?
	
1. Debug mainnet contract	
2. Interact with third-party contracts, such as Uniswap.

Forge supports testing in a forked environment with two **different approaches**:

1. [**Forking Mode**](https://book.getfoundry.sh/forge/fork-testing#forking-mode) — use a single fork for all your tests via the `forge test --fork-url xxx ` flag
2. [**Forking Cheatcodes**](https://book.getfoundry.sh/forge/fork-testing#forking-cheatcodes) — create, select, and manage multiple forks directly in Solidity test code via [forking cheatcodes](https://book.getfoundry.sh/cheatcodes/forking.html)

❓ Which approach to use? 



## Fuzz Testing

[What is fuzz testing](https://en.wikipedia.org/wiki/Fuzzing) ❓  

**Example**:  Play the game, the winner gets a prize.

1. Have you found the bug❓ 

2. How to use fuzz testing to test it and find bugs❓

```solidity

contract Lotto {
    bool public payedOut = false;
    uint256 public winAmount;

    // ... extra functionality here

    function play() public payable {
        winAmount += msg.value;
    }

    function sendToWinner(address winner) public {
        require(!payedOut);
        // send ETH to winner
        payable(winner).send(winAmount);
        payedOut = true; // play end
    }
		
    function withdrawLeftOver() public {
        require(payedOut);
        payable(msg.sender).transfer(address(this).balance);
    }
}
```

Do you have any questions ❓

```bash
forge test --match-contract FuzzTest 
[⠔] Compiling...
No files changed, compilation skipped

Running 1 tests for test/HowToTest/05.FuzzTest.sol:FuzzTest
[PASS] testFuzzSendToWinner(address) (runs: 256, μ: 96784, ~: 96892)  
```

How to set up test ❓

1. [global config](https://book.getfoundry.sh/reference/config/testing) 
2.  [inline test  config](https://book.getfoundry.sh/reference/config/inline-test-config)



## Invariant Testing

What is invariant  testing ❓ 

Invariant (properties or conditions) remains **unchanged** during the execution of the code. more [Invariant](https://book.getfoundry.sh/forge/invariant-testing)

Examples:

- *"The xy=k formula always holds"* for Uniswap
- *"The sum of all user balances is equal to the total supply"* for an ERC-20 token.
- "The wallet's debt is always less than 90% of their collateral." for an lending.
- "Where is "
- more ....



## Differential Testing

What is differential testing ❓ 

It is a method of comparing the outputs of different software implementations or versions to identify discrepancies and ensure consistency.

**Examples:**

+ Comparison between versions: 
  + Ensure that the result of 'balanceOf(account)' is equivalent between protocol version 1 and version 2.
+ Comparison of different implementations:
  + Implementation of the F(x) formula by f1(x) and f2(x): check  `log(x) ` between solidity and python.
+ Cross-platform testing



## Exercise

1. Use Foundry to test  [Exercise01.sol](./code/src/Exercise01.sol)  and identify bugs in them
1. Use Foundry to test your NFTMarket.sol
