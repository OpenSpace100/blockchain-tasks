//  SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {

  uint public counter;
  address public addr;

  constructor() {
      counter = 0;
  }

  // "0x06661abd"
  function count() public {
      counter = counter + 1;
      addr = msg.sender;
  }

   // 0x60fe47b1
   // set(uint x) -> set(uint256)
  function set(uint x) public returns (uint) {
      counter = x;
      return counter;
  }

    // 获取函数selector
    function getSelector() public pure returns (bytes4) {
        return this.set.selector;
    }

    function encodeWithSelector() public pure returns(bytes memory result) {
        result = abi.encodeWithSelector(0x60fe47b1, 10);
    }

    // 0xe74c813e3f545122e88A72FB1dF94052F93B808f,2,true
    function addUser(address a ,uint8 b ,bool c) public {
    }
    
    function encodeWithSignature() public pure returns(bytes memory result) {
        address addr = 0xe74c813e3f545122e88A72FB1dF94052F93B808f;
        uint8 s = 2; // 占一个字节
        bool b = true;
        result = abi.encodeWithSignature("addUser(address,uint8,bool)", addr, s, b);
    }
}

contract testAbi {
	function newCall() public  {
		Counter c = new Counter();
		c.count();
	}

  function newCall2(Counter c) public {
		c.count();
	}

  function callCounter(address counter, bytes memory payload) public {
    (bool success, ) = counter.call("0x06661abd");  // 0x06661abd
    require(success, "failed");
  }

  function callAnything(address counter, bytes memory payload) public {
    (bool success, ) = counter.call(payload);  // 0x06661abd
    require(success, "failed");
  }

}