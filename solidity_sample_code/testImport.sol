// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


// import "./token.sol";

// import { Token as T1} from "./token.sol";
import { Token } from "./token.sol";

import { Address } from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";



contract TokenEx {
    Token public token;
    using Address for address; 
}