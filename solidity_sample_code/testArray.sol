pragma solidity ^0.8.0;

contract testStringBytes {

    bytes bs;
    bytes bs0 = "12abcd";
    bytes bs1 = "abc\x22\x22";   // 十六进制数
    bytes bs2 = "Tiny\u718A";   // 718A为汉字“熊”的Unicode编码值


    string str1 = "TinyXiong\u718A";

    string name;
    function setName(string calldata _name) public {
        name = _name;
	}

    // storage 位置
    uint[10] tens; 
    uint[] public numbers; 
    uint[] public arr1 = new uint[](1);
    uint public total;
    uint calced;


    function modifyOnTens(uint x) public {
        tens[0] = x;
        // tens.push(x);  // error;
	}

    function add(uint x) public {
        arr1.push(x);
	}

    function arr1Len() public view  returns (uint len) {
        return arr1.length;
	}

    function copy(uint[] calldata arrs) public returns (uint len) {
        numbers = arrs;  // copy 
        return numbers.length;
    }

    function modifyNumbers() public {
        uint[] storage y = numbers;  // 不copy，指向同一个数据
        y[0] = 1;
    }

	function test(uint len) public {

        // 内存 位置
        string[4] memory adaArr = ["This", "is", "an", "array"];
        uint[] memory c = new uint[](len);
        // c.push(1);
        c[0] = 1;
        
	}

    function sum(uint end) public {
        if (end > calced) {
            for (uint i = calced; i < end; i++) {
                total += numbers[i];
            }
            calced = end;
        }
    }

    // gas issue
    function dosome(uint start, uint len) public {
        uint leng = numbers.length;
        for (uint i = start; i <  start + len; i++) {
            // do...
        }
    }

    // 移除元素推荐操作
    function remove(uint index) public {
        uint len = numbers.length;
        if (index == len - 1) {
            numbers.pop();
        } else {
            numbers[index] = numbers[len - 1];
            numbers.pop();
        }
    }
}


contract testStruct{

    struct Person {
        address account;
        bool gender;
        uint8 age;
    }

    Person  person1 = Person(address(0x1), true, 18);

    function person() external view returns (address account, bool gender, uint8 age) {
      return (person1.account, person1.gender, person1.age);
    }

}

