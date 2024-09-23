// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;  // 声明编译器版本: 
// pragma solidity >=0.8.0;
// pragma solidity >=0.8.0 <0.9.0;


// 定义变量格式：变量类型 [可见性] [可变状态] 变量名 [赋值];
// 可见性： public / private / internal 
// 可变状态: constant / immutable
contract TestVariable{
    uint public counter;

    uint private constant TEN = 10;
    uint public immutable THRESHOLD;
 
    constructor(uint t) {
       THRESHOLD = t;
    }

 
    function count() public {
       uint a = 503;
       counter = a + 1;
    }

    
    function cal(uint a) public pure returns (uint b) { return a + 1; }
    function setData(uint a) internal { data = a; }
    uint public data;
}