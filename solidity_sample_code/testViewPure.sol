    pragma solidity ^0.8.0;
    
    contract TestViewPure {
        uint private counter;
        uint private deposited;
    
 // 当义函数： function  函数名([参数列表])  可见性  [可变性]  [返回值]  {}
// 可见性： public / private / internal / external
// 可变性: view / pure / payable  

        function increase() public {
            counter = counter + 1;
        }

        // view  不修改状态
        function addTo(uint256 y) public view returns (uint256) {
            return counter + y;
        }

        // pure
        function add(uint256 i, uint256 j) public pure returns (uint256) {
            return i + j;
        }

        function deposit() public payable {
            deposited += msg.value;
        }

    }