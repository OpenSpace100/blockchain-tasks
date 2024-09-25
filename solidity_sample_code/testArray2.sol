pragma solidity ^0.8.0;

contract testArray2 {


    // 5个item, 每个 item 是数组
    uint[][5] groups; 

    // 创建 10个item  
    uint[][] xgroups = new uint[][](10);

    function newGroup(uint index, uint[] calldata arrs ) public {
        groups[index] = arrs;  // arrs[:2];
    }

    function getGroup(uint index) public view returns (uint[] memory ) {
        return groups[index];
    }

    function getGroupItem(uint index, uint ii)  public view returns (uint) {
        return groups[index][ii];
    }



    bytes bs;
    bytes bs0 = "12abcd";
    bytes bs1 = "abc\x22\x22";   // 十六进制数
    bytes bs2 = "Tiny\u718A";    // 718A 为汉字“熊”的Unicode编码值,, 
    string public str1 = "TinyXiong";
    
    string name;
    function setName(string calldata _name) public {
        name = _name;
	}

    function getLength() public view returns (uint) {
        // return bs0.length;   // 6
        // return bs1.length;   // 5
        return bs2.length;   // 5
        // return str1.length;   // error
    }

    function getItem(uint i) public view returns (bytes1) {
        return bs1[i];
         // return str1[1];  // error
    }

    function testConcat() public {
        str1 = string.concat(str1, str1);
    }

    // 前 4个字节： 0x21b55c42123abc  ->  0x21b55c42
    function forward(bytes calldata payload) external view returns (bytes4)  {
        bytes4 sig = bytes4(payload[:4]);
        return sig;
    }


}



