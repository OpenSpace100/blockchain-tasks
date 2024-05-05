//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Counter {
    // address public impl;
    uint public counter;

    function add(uint256 i) public {
        counter += 1;
    }

    function get() public view returns(uint) {
        return counter;
    }

    function uintToBytes32(uint i) external view returns (bytes32 data) {
        data = bytes32(i);
    }

    function read(bytes32 slot) external  view returns(bytes32 data){
            assembly {
                data := sload(slot) // load from store    
            }
    }

    function write(bytes32 slot,uint256 value) external {
            assembly{
                sstore(slot,value)
            }
    }

}

contract CounterV2 {
    // address public impl;
    uint public counter;

    function add(uint256 i) public {
        counter += i;
    }

    function get() public view returns(uint) {
        return counter;
    }
}

contract CounterProxy  {
    address public impl;   // impl + 2
    uint public counter;

    constructor(address _impl) {
        impl = _impl;
    }

    function upgradeTo(address _impl) public {
        impl = _impl;
    }

    // 分别代理到 Counter
    function add(uint256 n) external {
        bytes memory callData = abi.encodeWithSignature("add(uint256)", n);
        (bool ok,) = address(impl).delegatecall(callData);
        if(!ok) revert("Delegate call failed");
    }

    function get() external returns(uint256) {
        bytes memory callData = abi.encodeWithSignature("get()");
        (bool ok, bytes memory retVal) = address(impl).delegatecall(callData);

        if(!ok) revert("Delegate call failed");

        return abi.decode(retVal, (uint256));
    }


}