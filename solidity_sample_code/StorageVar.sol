// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract StorageVars {
    uint x;
    uint y;
    uint z;

    // gas : 75225
    function foo() public {
        y = 2;   // (SSTORE 0x01, 0x02)
        z = 3;   // (SSTORE 0x02, 0x03)
    }

    function bar() external view returns (uint) {
        return y ; // SLOAD 0x01 , MSTORE ..., RETURN
    }

}


contract StorageCompact {
    uint8 x;  // slot 0
    uint8 y;  // slot 0

    function foo() public returns (uint8) {
        uint8 sum = x + y;
        return sum;
    }


// gas : 50242
    function bar() public {
        x = 1;
        y = 2;
    }

}

contract StorageStruct {
    // slot 0
    uint z;
    
    struct Point {
        uint8 x;
        uint8 y;
        uint8 z;
    }
    // slot 1
    Point p;

    function foo() public view returns (uint8) {
        uint8 sum = p.x + p.y + p.z;
        return sum;
    }

}


contract StorageMapping {
    mapping(address => uint) public x;

    function foo(address a, address b) public {
        x[a] = 1;  // slot = keccak256(abi.encode(key, slot_x))
        x[b] = 2;  // slot = keccak256(abi.encode(key, slot_x))
    }

    function getMappingSlot(address key) public pure returns (bytes32) {
        uint256 slot = 0; // 假设 mapping 声明在槽位 0
        return keccak256(abi.encode(key, slot));
    }

    function getValueAtKey(address key) public view returns (uint256 value) {
        bytes32 slot = getMappingSlot(key);
        assembly {
            value := sload(slot)
        }
    }

    // 0x0000000000000000000000000000000000000000000000000000000000000000
    function getValueAtSlot(bytes32 slot) public view returns (uint256 value) {
        assembly {
            value := sload(slot)
        }
    }


}

contract StorageArray {
    uint a; // slot 0
    uint[2] public b; // slot 1, 2
    uint[] public c; // slot 3  // save length, 元素数据存储的起始位置是：keccak256(slot)

    uint32[2] public d; // slot 4

    function foo() public {
        b[0] = 1;
        b[1] = 2;

        c.push(3);
        c.push(4);

        d[0] = 1;
        d[1] = 2;
    }

    function getArraySlotStart() public pure returns (bytes32) {
        uint256 slot = 3; // 动态 array 声明在槽位 3
        return keccak256(abi.encode(slot));
    }

    function getValueAtIndex(uint index) public view returns (uint256 value) {
        bytes32 slot = bytes32(uint256(getArraySlotStart()) + index);
        assembly {
            value := sload(slot)
        }
    }

    function getValueAtSlot(bytes32 slot) public view returns (bytes32 value) {
        assembly {
            value := sload(slot)
        }
    }
}


contract StorageString {
    string public a = "short"; // slot 0  少于 31 字节 // cast from-utf8 "short"  0x73686f7274
    
    string public b = "too too too too too too too too too too too too too too long"; // slot 1
    // cast from-utf8 "too too too too too too too too too too too too too too long"
    // 0x746f6f20746f6f20746f6f20746f6f20746f6f20746f6f20746f6f20746f6f20746f6f20746f6f20746f6f20746f6f20746f6f20746f6f206c6f6e67

    function getArraySlotStart() public pure returns (bytes32) {
        uint256 slot = 1; // 动态 array 声明在槽位 1
        return keccak256(abi.encode(slot));
    }

    function getValueAtSlot(bytes32 slot) public view returns (bytes32 value) {
        assembly {
            value := sload(slot)
        }
    }

}