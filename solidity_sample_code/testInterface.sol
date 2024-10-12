pragma solidity ^0.8.10;

interface ICounter {
   function count() external view returns (uint);
   function increment() external;
}

contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }
}

contract MyContract {
    function incrementA(address _counter) external {
        ICounter(_counter).increment();
    }

    function increment(ICounter icounter) external {
        icounter.increment();
    }

    function incrementC(Counter counter) external {
        counter.increment();
    }

}