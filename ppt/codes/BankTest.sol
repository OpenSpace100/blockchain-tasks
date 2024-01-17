// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/Bank.sol";

contract BankMock is BigBank {
    function getOwner() external returns (address) {
        return owner;
    }

    function stake() public payable {
        deposit();
    }
}

contract BankTest is Test {
    BankMock bank;

    address admin = makeAddr("myadmin");
    address alice = makeAddr("alice");

    function setUp() public {
        deal(alice, 10000 ether);

        vm.startPrank(admin);
        {
            // 使用管理员身份执行代码
            bank = new BankMock();
        }
        vm.stopPrank();
    }

    function test_Owner() public {
        assertEq(bank.getOwner(), admin, "expect owner is myadmin");
    }

    function test_Deposit() public {
        vm.startPrank(alice);

        uint256 amount = 1 ether;
        (bool success,) = address(bank).call{value: amount}("");
        assertTrue(success, "expect transfer ok!");

        (success,) = address(bank).call{value: amount}("");
        assertTrue(success, "expect transfer ok!");

        uint256 banlace = bank.viewBalance();
        assertEq(banlace, 2 ether, "expect balance is 2 ethers.");
    }

    function testFail_MinDeposit() public {
        vm.startPrank(alice);
        (bool success,) = address(bank).call{value: 0.001 ether}("");
        require(success, "failed");
    }

    function test_MinDeposit() public {
        vm.startPrank(alice);

        // 执行成功，代码可以继续
        bank.stake{value: 0.001 ether + 1}();

        // 期望失败，有错误信息
        // 期望失败，有错误信息
        uint256 amount =0.001 ether;
        vm.expectRevert(abi.encodeWithSelector(BigBank.AmountNotEnough.selector,amount));
        bank.stake{value: amount}();
    }

    function test_Withdraw() public {
        vm.startPrank(alice);
        // 没有存款时，则取款失败
        {
            vm.expectRevert(" Balance too low");
            bank.userWithdraw();
        }
    }
}
