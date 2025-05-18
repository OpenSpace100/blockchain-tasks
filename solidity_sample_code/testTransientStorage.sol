pragma solidity ^0.8.26;

// Make sure EVM version and VM set to Cancun

// Storage - data is stored on the blockchain
// Memory - data is cleared out after a function call
// Transient storage - data is cleared out after a transaction

interface ITest {
    function setX(uint x) external returns (uint256);
    function val() external view returns (uint256);
    function test() external;
}

contract Callback {
    uint256 public v;

    fallback() external {
        // v = ITest(msg.sender).val();
        ITest(msg.sender).setX(1);
    }

    // 分别调用以下两个合约的 test 方法
    //  ReentrancyGuard gas  78468
    //  ReentrancyGuardTransient 29991
    function test(address target) external {
        ITest(target).test();
    }
}

// 对比两个合约的 Gas 
//  TestStorage addr  
// TestTransientStorage  
contract TestStorage {
    uint256 public val;

    // gas 
    function test() public {
        val = 123;
    }
}

contract TestTransientStorage {
    uint256 public transient val;
    // gas 
    function test() public {
        val = 123;
    }
}

contract ReentrancyGuard {
    uint256 public val;
    uint256 private locked = 1;

    modifier nonReentrant() {
        require(locked == 1, "REENTRANCY");
        locked = 2;
        _;
        locked = 1;
    }

    function setX(uint _x) public nonReentrant {
        val = _x;
        //    Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract ReentrancyGuardTransient {
    uint256 public val;
    uint256 private transient locked;

    modifier nonReentrant() virtual {
        require(locked == 0, "REENTRANCY");
        locked = 1;
        _;
        locked = 0;
    }

    function setX(uint _x) external nonReentrant {
        val = _x;
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}
