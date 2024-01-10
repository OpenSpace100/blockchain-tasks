// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract testOwner {
    address public  owner;
    uint deposits;
    // mapping(address => uint) public deposits;

    constructor() payable {
        owner = msg.sender;
    }

    function deposit() public payable {
      deposits += msg.value;
    }

    receive() external payable {
      deposits += msg.value;
    }
    
}
