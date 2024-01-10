// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract testPayable {

    

    // 没有的时候，无法接收ETH
    receive() external payable {


    }  
}