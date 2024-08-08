// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/utils/Multicall.sol";

import "@openzeppelin/contracts/utils/Address.sol";


contract TestMulticall {

    mapping(address => uint256) public deposits;
    uint public count; 

    // 0xd09de08a
    function increment() external payable {
        count += 1;
        deposits[msg.sender] += msg.value;
    }

    // issue: payable need to remove 

    // [0xd0e30db0, 0xd09de08a]
    function multicall(bytes[] calldata data) external payable returns (bytes[] memory results) {
        results = new bytes[](data.length);
        for (uint256 i = 0; i < data.length; i++) {
            results[i] = Address.functionDelegateCall(address(this), data[i]);
        }
        return results;
    }

    // 0xd0e30db0
    function deposit() external payable {
        deposits[msg.sender] += msg.value;
    }

    // 
    function withdraw() external {
        uint d = deposits[msg.sender];
        deposits[msg.sender] = 0;
        (bool success, ) = msg.sender.call{value: d}("");
        require(success, "Failed to send Ether");
    }


}