// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ContractWallet {
    event Deposit(address indexed sender, uint amount, uint balance);
    event ExecuteTransaction(
        address indexed to,
        uint value,
        bytes data
    );


    address public owner;

    modifier onlyOwner() {
        require( owner == msg.sender, "not owner");
        _;
    }

    constructor(address  _owner) {
        owner = _owner;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    function executeTransaction(
        address _to,
        uint _value,
        bytes memory _data
    ) public onlyOwner {

        (bool success, ) = _to.call{value: _value}(
            _data
        );
        
        require(success, "tx failed");

        emit ExecuteTransaction(_to, _value, _data);

    }

}
