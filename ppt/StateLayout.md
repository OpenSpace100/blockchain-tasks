# Layout of State
<!--  -->
## Why do you need to know?

1. Write or read status data cost gas!    GAS Token

```
SloadGas        = 50
SstoreSetGas    = 20000 // Once per SSTORE operation.
SstoreResetGas  = 5000  // Once per SSTORE operation if the zeroness changes from zero.
SstoreClearGas  = 5000  // Once per SSTORE operation if the zeroness doesn't change.
SstoreRefundGas = 15000 // Once per SSTORE operation if the zeroness changes to zero.
```

2. Reset data usage slots

   ```solidity
   
       struct OwnableStorage {
           address _owner;
       } 
       bytes32 private constant OwnableStorageLocation = 0x9016d09d72d40fdae2fd8ceac6b6234c7706214fd39c1cd1e609a0528c199300;
       function _getOwnableStorage() private pure returns (OwnableStorage storage $) {
           assembly {
               $.slot := OwnableStorageLocation
           }
       }
   ```

   

   





## Slot = Index/key

Read value from **key-value** database!

```
value =  db.get(key)  / // value is 32 bytes = uint256
```

<img src="https://img.learnblockchain.cn/book_geth/2019-11-3-21-30-13.png!de?width=600px&heigth=400px" style="zoom:50%;" />

![](https://img.learnblockchain.cn/book_geth/2019-11-3-21-44-32.png!de?width=600px)

 Have  $2^{256}-1$  slots for every contract .

 total slots = 5 * sands on the earth !

<img src="https://img.learnblockchain.cn/learn/CleanShot%202024-01-25%20at%2010.02.40%402x.png" style="zoom:50%;" />



## How to get the slot?

[Using the Solidity Compiler](https://docs.soliditylang.org/en/latest/using-the-compiler.html)

call `solc --storage-layout src/Bank.sol`

```json
{
    "astId": 40,
    "contract": "src/Bank.sol:Bank",
    "label": "owner",
    "offset": 0,
    "slot": "0",
    "type": "t_address"
}
```

- `astId` is the id of the AST node of the state variable’s declaration
- `contract` is the name of the contract including its path as prefix
- `label` is the name of the state variable
- `offset` is the offset in bytes within the storage slot according to the encoding
- `slot` is the storage slot where the state variable resides or starts. This number may be very large and therefore its JSON value is represented as a string.
- `type` is an identifier used as key to the variable’s type information (described in the following)

## Slot rules

1. Store the variables in the order in which they are defined.
2. Compact Storage： Less than 32 bytes, stored in a Slot.

### case1: fixed-length storage

value types: Booleans、number、address...

```solidity
contract StorageExample {
    uint8  public a = 11; // 0
    uint256 b=12; // 1
    uint256[2] c= [13,14]; // [2]=13,[3]=14  //. c[0]=13*2  // set store(2,26)
    Entry d; // [1]=[age], [2]=ethBalance
 
    
    struct Entry {
        uint8 age; // max= 256
        uint256  ethBalance; // eth 
    }
}
```

<img src="https://img.learnblockchain.cn/book_geth/2019-11-3-22-19-1.png!de?width=400px" alt="img" style="zoom:50%;" />

### case2: compact storage

```
contract StorageExample2 {
    uint256 a = 11;  
    uint8 b = 12;  
    uint128 c = 13;
    bool d = true; 
    uint128 e =  14; 
}
```

![合约的存储布局](https://img.learnblockchain.cn/book_geth/2019-11-6-21-56-39.png!de?width=600px)



### Case3: dynamic data storage: string/array

string = bytes = []bytes32 = []number

if content size < 32 :    32bytes= [ content,....         ,size*2] 

else 32bytes= [......         ,size*2+1] 

```
contract Example{
	 string a  = "我比较短"; //0
	 // [1]=value= length * 2 +1 
	 // start = hash(slot=1)= uint256 
	 // slots[start+0],slots[start+1],....slots[start+3]
   string b  = "我特别特别长，已经超过了一个插槽存储量"; 
   uint16[] public x =  [401,402,403,405,406];
   uint256[] public y =  [401,402,403,405,406];
}
```

![以太坊技术与实现-图1](https://img.learnblockchain.cn/book_geth/%E4%BB%A5%E5%A4%AA%E5%9D%8A%E6%8A%80%E6%9C%AF%E4%B8%8E%E5%AE%9E%E7%8E%B0-%E5%9B%BE2019-11-6-22-7-15!de?width=600px)



### Case4: dynamic data storage: mapping

Value start slot =    `hash(abi.encode(key,mapSlot=0))   ` 

```
contract StorageExample5 {
   mappping(string => uint256) a;// 0
   mappping(string => uint256) b;// 1

   constructor()public {
       a["u1"]=18; // u1 value slot = hash("u1",0) 
       a["u2"]=19; // u2 value slot = hash("u2",0) 
   }
}
```



## Example

![Solidity 合约存储布局示例.png](https://img.learnblockchain.cn/book_geth/20191107160911.png!de)

![](https://img.learnblockchain.cn/learn/202401251525703.png)

## How to write/read store?

```solidity
 function read(bytes32 slot) external  view returns(bytes32 data){
        assembly {
            data := sload(slot) // load from store    
        }
 }
 function write(bytes32 slot,uint256 value) external {
        assembly{
            sstore(slot,value)
        }
 }
```

or call  etc_storageAt() RPC API



## Exercise

在NFT Market合约中使用Slot模式读取和修改Owner地址
