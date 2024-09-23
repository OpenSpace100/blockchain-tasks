
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0;

contract testEnum {

    enum Color {  Red, White, Blue}
    Color color;

    function setColor(Color c) public {
        color = c;
    }

    function getMaxValue() public pure returns (Color) {
        return type(Color).max;
    }

    function getMinValue() public pure returns (Color) {
        return type(Color).min;
    }

}