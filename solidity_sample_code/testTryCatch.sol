pragma solidity ^0.8.0;

contract Foo {
    error nonZero();
    

    function myFunc(uint x) public pure returns (uint ) {
        // require(x != 0, "require failed");
        if (x == 0) revert nonZero();

        return x + 1;
    }
}

interface IFoo {
    function myFunc(uint x) external pure returns (uint );
    function myFunc2(uint x) external pure returns (uint );
}


contract trycatch {

    IFoo public foo;
    uint public y; 

    string public errMsg;
    bytes public errBytes;

    constructor(address f) {
        foo = IFoo(f);
    }

    function tryCatchExternalCall(uint _i) public {
        // foo.myFunc(_i);
        
        try foo.myFunc2(_i) returns (uint result) {
            y = result;
        } catch Error(string memory reason) { //  catch revert 
            errMsg = reason;
        } catch (bytes memory reason) {  // catch 
            errBytes = reason;
        }

        
    }
}