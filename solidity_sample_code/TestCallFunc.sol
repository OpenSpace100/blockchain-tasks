// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract callee {
    function g(uint a) public pure returns (uint ret) {
        return 3;
     }
}

contract TestCallFunc {
    uint public counter ;

    function increase() public {
        counter = counter + 1;
    }

    function set(uint key, uint value) public {
    }

    // 具名调用
    function callWithName() public {
        // set(2, 3);
        set({value: 2, key: 3});
    }

    function internalFunc() public {
        increase();
    }


    function externalFunc() public {
        // this.increase();
        // this.increase{value: 10, gas: 60000 }();
        this.increase{ gas: 60000 }();  

    }

        function callThirdFunc(callee c) public {
            // c.g(10);   最常见
            c.g{ gas: 60000 }(10);
        }

}