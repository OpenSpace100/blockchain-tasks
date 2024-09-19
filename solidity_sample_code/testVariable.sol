// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

// 格式：变量类型 [可见性] [可变状态] 变量名 [赋值];

contract TestVariable{
    uint public counter;

    uint private constant TEN = 10;
    uint public immutable THRESHOLD;
 
    constructor(uint t) {
       THRESHOLD = t;
    }

 
    function count() public {
       uint256 a = 503;
       counter = a + 1;
    }

    
    function cal(uint a) public pure returns (uint b) { return a + 1; }
    function setData(uint a) internal { data = a; }
    uint public data;
}
