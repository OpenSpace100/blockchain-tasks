//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ECDSA } from  "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/ECDSA.sol";

import { MessageHashUtils } from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/MessageHashUtils.sol";

// https://eips.ethereum.org/EIPS/eip-191

contract TestVerify {

    function getHash(bytes memory message) public pure returns (bytes32) {
        bytes32 hash = MessageHashUtils.toEthSignedMessageHash(message);
        return hash;
    }


    // https://cn.etherscan.com/verifySig/34423
    // siger: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
    // message: hello world -> 0x68656c6c6f20776f726c64
    // Signature: 0xa461f509887bd19e312c0c58467ce8ff8e300d3c1a90b608a760c5b80318eaf15fe57c96f9175d6cd4daad4663763baa7e78836e067d0163e9a2ccf2ff753f5b1b
    function recover(bytes memory message, bytes memory signature) public pure returns (address) {
        bytes32 hash = MessageHashUtils.toEthSignedMessageHash(message);
        return ECDSA.recover(hash, signature);
    }

    

}