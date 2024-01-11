pragma solidity ^0.8.10;

contract testModifier {

    address public owner;
    uint private deposited = 0;


    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function  withdraw() public onlyOwner {
        payable(owner).transfer(deposited);
    }

    fallback() external payable {
        deposited += msg.value;
    }

    function getDeposited() public view returns(uint) {
        return deposited;
    }



}