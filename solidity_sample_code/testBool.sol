
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0;

contract testBool {

    bool public isOpen = true;
    bool public isChanged = false;

    function setOpen(bool o) public  {
        isOpen = o;
        if( isOpen || tryChange() ) {
            // ....
        }
    }

    function tryChange() internal returns (bool) {
        isChanged = !isChanged;
        return isChanged;
    }

}