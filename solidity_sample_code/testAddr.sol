pragma solidity ^0.8.0;


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

contract testAddr {

  constructor() payable {

  }

   // 如果合约的余额大于等于10，则给x转10 ether
	function testTrasfer(address payable x) public {
	address myAddress = address(this);

        if (myAddress.balance >= 10 ether) {
            x.transfer(10 ether);
        }
	}

  	function testCall(address payable x, uint amount) public payable {
		// x.transfer(1 ether);   // 2300
		// x.call{value: amount}(new bytes(0));

		Address.sendValue(x, amount); 
	}

  	function getCode(address x) public view returns (bytes memory) {	
		return x.code;
	}

	function getCodeHash(address x) public view returns (bytes32) {	
		return x.codehash;
	}

  function balance(address addr) public view returns (uint) {
      return addr.balance;
  }

}

