
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract testGetter {
  uint public counter;
  mapping(address => uint) public balances;
  uint[] public numbers;
  uint[][] public numberArrs;


  struct Data {
      uint a;
      uint b;
  }

  Data public data;

}