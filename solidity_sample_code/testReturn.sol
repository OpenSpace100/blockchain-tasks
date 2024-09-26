// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;  


// 定义变量格式：变量类型 [可见性] [可变状态] 变量名 [赋值];
// 可见性： public / private / internal 
// 可变状态: constant / immutable

contract TestReturn{
    uint private counter;
 
    function count() public {
       counter = counter + 1;
    }

    // 返回值有多个
    function returnTwo() public pure returns (uint256, uint256) {
        return (1, 2);
    }

    // 返回值可以有变量名, 赋予返回值 含义
    function returnNamed() public pure returns (uint256 x, uint256 y) {
        return (1, 2);
    }

    // 返回值有变量名, 可以为变量赋值，这不用 return
    function ignoreReturn() public pure returns (uint256 x, uint256 y) {
        x = 1;
        y = 2;
    }

    // 多种方式获取返回值
    function callGetReturn() public {
        (uint256 x, uint256 y) = returnTwo();
        counter += x;
        counter += y;

        (uint256 x1, ) = returnNamed();
         (, uint256 x2) = ignoreReturn();
       
        counter += x1;
        counter += x2;


    }
    
}