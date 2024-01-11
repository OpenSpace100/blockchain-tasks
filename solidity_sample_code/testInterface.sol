pragma solidity ^0.8.10;

interface ICounter {
    function increment() external;
}

contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

}