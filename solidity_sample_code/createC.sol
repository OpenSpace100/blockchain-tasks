pragma solidity  >=0.8.0;


import { CREATE3 } from "https://github.com/transmissions11/solmate/blob/main/src/utils/CREATE3.sol";

contract C {
    function f(uint a) private pure returns (uint b) { return a + 1; }
    function setData(uint a) internal { data = a; }
    uint public data;
}


contract CreateC {

    function createContract() public returns (address) {
        C  c = new C();
        return address(c);
    }

    function createMinContract(address impl) public returns (address) {
        return createClone(impl);
    }

    function create2Contract(uint _salt) public returns (address) {
        C c = new C{salt: keccak256(abi.encode(_salt))}();
        return address(c);
    }

    function create3Contract(uint _salt, bytes memory creationCode ) external returns (address deployed) {
        deployed = CREATE3.deploy(
            keccak256(abi.encode(_salt)), 
            creationCode,
            0
    );
    }

    function getCreate2Address(uint _salt) public view returns (address) {
        bytes memory bytecode = type(C).creationCode;
        //  if constructor
        // bytecode = abi.encodePacked(bytecode, abi.encode(p1, p2));

        bytes32 hash = keccak256(
            abi.encodePacked(bytes1(0xff), address(this), keccak256(abi.encode(_salt)), keccak256(bytecode))
        );

        // NOTE: cast last 20 bytes of hash to address
        return address(uint160(uint(hash)));
    }

    function createClone(address prototype) internal returns (address proxy) {
        bytes20 targetBytes = bytes20(prototype);
        assembly {
            let clone := mload(0x40)
            mstore(clone, 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
            mstore(add(clone, 0x14), targetBytes)
            mstore(
                add(clone, 0x28),
                0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000
            )
            proxy := create(0, clone, 0x37)
        }
        return proxy;
    }


    error InvalidNonceValue(address emitter);
    // cal addree for create opcode 
    // copy code from https://github.com/pcaversaccio/create-util/blob/main/contracts/Create.sol

    function getCreateAddress(address addr, uint256 nonce) public view returns (address) {
        bytes memory data;
        bytes1 len = bytes1(0x94);

        /** 
         * @dev The theoretical allowed limit, based on EIP-2681, for an account nonce is 2**64-2:
         * https://eips.ethereum.org/EIPS/eip-2681.
         */
        if (nonce > type(uint64).max - 1) revert InvalidNonceValue(address(this));

        /** 
         * @dev The integer zero is treated as an empty byte string and therefore has only one
         * length prefix, 0x80, which is calculated via 0x80 + 0.
         */
        if (nonce == 0x00) data = abi.encodePacked(bytes1(0xd6), len, addr, bytes1(0x80));

        /** 
         * @dev A one-byte integer in the [0x00, 0x7f] range uses its own value as a length prefix,
         * there is no additional "0x80 + length" prefix that precedes it.
         */
        else if (nonce <= 0x7f) data = abi.encodePacked(bytes1(0xd6), len, addr, uint8(nonce));

        /**
         * @dev In the case of `nonce > 0x7f` and `nonce <= type(uint8).max`, we have the following
         * encoding scheme (the same calculation can be carried over for higher nonce bytes):
         * 0xda = 0xc0 (short RLP prefix) + 0x1a (= the bytes length of: 0x94 + address + 0x84 + nonce, in hex),
         * 0x94 = 0x80 + 0x14 (= the bytes length of an address, 20 bytes, in hex),
         * 0x84 = 0x80 + 0x04 (= the bytes length of the nonce, 4 bytes, in hex).
         */
        else if (nonce <= type(uint8).max) data = abi.encodePacked(bytes1(0xd7), len, addr, bytes1(0x81), uint8(nonce));
        else if (nonce <= type(uint16).max) data = abi.encodePacked(bytes1(0xd8), len, addr, bytes1(0x82), uint16(nonce));
        else if (nonce <= type(uint24).max) data = abi.encodePacked(bytes1(0xd9), len, addr, bytes1(0x83), uint24(nonce));
        else if (nonce <= type(uint32).max) data = abi.encodePacked(bytes1(0xda), len, addr, bytes1(0x84), uint32(nonce));
        else if (nonce <= type(uint40).max) data = abi.encodePacked(bytes1(0xdb), len, addr, bytes1(0x85), uint40(nonce));
        else if (nonce <= type(uint48).max) data = abi.encodePacked(bytes1(0xdc), len, addr, bytes1(0x86), uint48(nonce));
        else if (nonce <= type(uint56).max) data = abi.encodePacked(bytes1(0xdd), len, addr, bytes1(0x87), uint56(nonce));
        else data = abi.encodePacked(bytes1(0xde), len, addr, bytes1(0x88), uint64(nonce));

        return address(uint160(uint256(keccak256(data))));
    }
}