pragma solidity ^0.8.0;

contract testError {

    address owner;

    error NotOwner();
    uint x;

    constructor() {
        owner = msg.sender;
    }


    function doSomething() public {
        if(msg.sender != owner) revert NotOwner();  // 23388

        require(msg.sender == owner, "Not owner 00000000000000");   // 23642
        x += 1;

        assert(x > 0);
    }
}