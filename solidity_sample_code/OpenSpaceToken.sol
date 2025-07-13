// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OpenSpaceToken is ERC20 {
    constructor() ERC20("OpenSpace", "OPS") {
        // 初始发行 1,000,000,000 个代币
        _mint(msg.sender, 1_000_000_000 * 10 ** decimals());
    }
} 