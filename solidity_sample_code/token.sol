//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract  Token {

    mapping(address => uint256) public holds;

    constructor(uint total)  {
        holds[msg.sender] = total;
    }

    function sendTo(address to, uint x) public  {
        holds[msg.sender] -= x;
        holds[to] += x;
    }


}