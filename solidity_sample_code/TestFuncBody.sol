// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract TestFuncbody {
    function testFor() public pure {
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                continue;   // 忽略下一次循环
            }
            if (i == 5) {   
                break;   // 退出
            }
        }
    }

    function testWhile() public pure returns (uint) {
        uint256 i;
        while (i < 10) {   
            i++;
            if (i == 5 || i == 8) {
                // ...
            }
        }
        return i;
    }

}
