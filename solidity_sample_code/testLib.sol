
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

library SafeMath {

}


library SafeMath2 {

}

contract TestLib {


    function add(uint x, uint y, uint z) internal pure returns (uint) {
        uint z = x + y;
        require(z >= x, "uint overflow");

        return z;
    }

    // using SafeMath for uint;
    // using SafeMath2 for uint;

    function add(uint x, uint y) external view returns (uint) {
        
        // return x.add(y);
        // return SafeMath.add(x, y);
    }

    function mm() public {
        // add(1, 2);  // internal
        this.add(1, 2);
    }


}