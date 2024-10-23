// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// 从 https://solidity-by-example.org/inheritance/ 复制

/* 继承图
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B is A {
    // 重载 A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    // 重载 A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}


// 当调用的函数在多个父合约中有定义时，
// 会从右到左深度优先查找父合约，匹配时停止

contract D is B, C {
    // D.foo() 返回 "C" 
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B {
    // E.foo() 返回 "B"
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}

// 多重继承，is 后的顺序：使用“基”到“派生”的顺序列出
contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}
