
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract testDeposit {

    mapping(address => uint) public deposits;
    event Deposit(address addr, uint value);
    
    function deposit(uint value) public {
        deposits[msg.sender] = value;
        emit Deposit(msg.sender, value);
    }
}

// web3.eth.getTransactionReceipt('0x....').then(console.log);