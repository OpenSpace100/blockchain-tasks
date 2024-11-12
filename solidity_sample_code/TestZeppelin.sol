

//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts@5.1.0/access/Ownable.sol";

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.1.0/contracts/access/Ownable.sol



contract TestZeppelin is Ownable {
    constructor() Ownable(msg.sender) {
    }
}

