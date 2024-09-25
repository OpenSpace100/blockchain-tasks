pragma solidity ^0.8.0;

contract testArray {
    // 定长 、storage 位置 
    uint[10] tens; 

    //  变长 
    // uint[] public numbers; 
    uint[] public numbers = [1, 2, 5, 5, 6 ,6 , 9, 19, 3, 10, 12, 23]; 
    uint[] public arr1 = new uint[](1);


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

    uint public total;
    uint calced;

    function sum(uint end) public {
        if (end > calced) {
            for (uint i = calced; i < end; i++) {
                total += numbers[i];
            }
            calced = end;
        }
    }

     // gas issue    58388
    function dosome() public {
        uint leng = numbers.length;
        for (uint i = 0; i < leng; i++) {
            // do...
            total += numbers[i];
        }
    }

    // 
    function dosome2(uint start, uint len) public {
        for (uint i = start; i <  start + len; i++) {
            // do...
            total += numbers[i];
        }
    }


}

