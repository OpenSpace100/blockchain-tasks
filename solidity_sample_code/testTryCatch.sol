pragma solidity ^0.8.0;
import "hardhat/console.sol";

interface ICounter {
    function count() external;
}

contract trycatch {
   
    uint public y; 

    error Zero();

    function myFunc(uint x) external returns (uint ) {
        // require(x != 0, "require failed");
        if (x == 0) revert Zero();

        if (x == 1) {
            // revert  a message
            revert("error when 2 ");
        }

        if (x == 2) {
            // revert without a message
            revert();
        } 

        if (x == 3) {
            uint256 b = 0;
            x / b;   // panic
        } 

        if (x == 4) { // if gas = 50000 will out-of-gas
            while(y < 1000) {  //  need about 600k gas
                y += 1;
            }
        }
        return y;

    }

    
    string public errMsg;
    bytes public errBytes;
    uint public errCode;

    constructor( ) {
    
    }

    function tryCatchExternalCall(uint _i) public {
        // foo.myFunc(_i);
        try this.myFunc{gas: 50000}(_i) returns (uint result) {
            y = result;
        } catch Panic(uint256 errorCode) {  // 处理非法操作，  assert 错误
            //<-- handle Panic errors
            errCode = errorCode;
            console.log("error occurred with this error code: ", errorCode);
        } 
        catch Error(string memory reason) { //  catch revert 处理所有带有原因字符串的回滚
            errMsg = reason;
            console.log("error occured with this reason: ", reason);
        } catch (bytes memory lowLevelData) {  // 处理任意错误，包含自定义错误和没有消息字符串的错误。
            if (lowLevelData.length == 0) {
                console.log("revert without a message occured");
            } 
            errBytes = lowLevelData;
            console.log("anyother error");
        }
        // 对错误数据不感兴趣，也可以使用 catch{ } 块， 将捕获来自被调用合约的任何错误
    }


    function cantCatch(uint cases) public {
        if (cases ==0 ) {
            try ICounter(address(0x01)).count() {
            } catch { 

            }
        } else if (cases == 1 ) {
            try this.myFunc(1) {
            } catch Error(string memory reason) { 
                console.log("catch then throw");
                revert();
            } catch {

            }
        } else if (cases == 2 ) { // throw panic but only catch reason error
            try this.myFunc(3) {  // throw panic
            } catch Error(string memory reason) {   // catch reason error
            }
        }  

    }
    

}