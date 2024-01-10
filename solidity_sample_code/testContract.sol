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

    // 0xb8e010de
  function set() public {
      counter = counter + 5;
  }


}



contract testContract {
	function newCall() public  {
		Counter c = new Counter();
		c.count();
	}

    function newCall2(Counter c) public  {
		c.count();
	}

}