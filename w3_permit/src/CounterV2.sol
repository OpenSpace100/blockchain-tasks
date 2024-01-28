// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;



contract CounterV2 {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function add(uint i) public {
        number += i;
    }
}
