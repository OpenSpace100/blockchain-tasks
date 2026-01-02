// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract testRefund {
    uint x;

    // 43320(init)
    function set1Slot() public {
        x = 2;
    }

    // gas 26220
    function update1Slot() public {
        x = 3; 
    }

    // gas 21397
    function set1SlotWithRefund() public {
        x = 0; 
    }

}