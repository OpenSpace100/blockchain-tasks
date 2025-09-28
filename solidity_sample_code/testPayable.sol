// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract testPayable {

    uint  public called ;

    // 没有的时候，无法接收ETH
    receive() external payable {
    }  

    // call  0x12345678    
    // fallback() external payable {
    //     called += 1;
    // }  
}

contract Test {
    function hello() public {
    }
}


contract Caller {
    // 使用 testPayable 合约作为参数试试, testPayable 没有 hello 方法, 如果目标没有 fallback ，则调用失败
    function callTest(Test test) public  {
        test.hello();
    }

   // 如果合约的余额大于等于10，则给x转10 ether
	function testTrasfer(address payable x) public {
	    address myAddress = address(this);

        if (myAddress.balance >= 10 ether) {
            x.transfer(10 ether);  // 2300 gas
            // (bool r, ) = x.call{value: 10 ether}(new bytes(0));
            // require(r, "transfer error");
        }
	}
}