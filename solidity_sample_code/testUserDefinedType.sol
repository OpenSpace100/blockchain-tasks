// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0;

contract testUserDefinedType {

    type Duration is uint256;
    type Timestamp is uint256;

    function TimePassed(Timestamp curr, Duration pass) public view returns (Timestamp){
        uint t = Timestamp.unwrap(curr) + Duration.unwrap(pass);

        return Timestamp.wrap(t);
    }

}

