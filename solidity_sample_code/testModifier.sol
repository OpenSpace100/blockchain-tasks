// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract testModifier {

    address public owner;
    uint private deposited = 0;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function transferOwner(address _newO) public onlyOwner {
        owner = _newO;
    }

    modifier over22(uint age) {
        require (age >= 22, "too small age");
        _;
    }


    function marry(uint age) public over22(age) {
       // do something
    }

    function marry2(uint age) public payable over22(age) {
        deposited += msg.value;
    }

}

contract TestModify2 {
    uint a = 10;

    modifier mf1 (uint b) {
        uint c = b;
        _;
        c = a;
        a = 11;
    }

    modifier mf2 () {
        uint c = a;
        _;
    }

    modifier mf3() {
        a = 12;
        return ;
        _;
        a = 13;
    }

    function test1() mf1(a) mf2 mf3 public   {
        a = 1;
    }

    function get_a() public view returns (uint)   {
        return a;
    }
}