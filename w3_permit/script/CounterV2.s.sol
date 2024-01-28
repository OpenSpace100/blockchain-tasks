// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "./BaseScript.s.sol";

import { Upgrades, Options } from "openzeppelin-foundry-upgrades/Upgrades.sol";


contract CounterScript is BaseScript {
    

    function run() public broadcaster {

        Options memory opts;
    //   opts.unsafeSkipAllChecks = true;
        opts.referenceContract = "Counter.sol";

        // proxy: 0x2279B7A0a67DB372996a5FaB50D91eAA73d2eBe6
        Upgrades.upgradeProxy(0x2279B7A0a67DB372996a5FaB50D91eAA73d2eBe6, "CounterV2.sol", "", opts);

    }
}
