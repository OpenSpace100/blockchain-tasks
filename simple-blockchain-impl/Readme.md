## 实现一个最基础的单链

Blockchain 框架代码：

 ```python
 class Blockchain(object):
     def __init__(self):
         self.chain = []
         self.current_transactions = []
 
     # 创建新区块
     def new_block(self):
         pass
 
     # 加入交易，到交易列表
     def new_transaction(self, sender: str, recipient: str, amount: int):
         pass
     
     @staticmethod
     def hash(block):
         # 
         pass
 
     # 工作量证明找到合适的 proof 
     def proof_of_work(self, last_proof: int) -> int:
     		pass
       
 
     @property
     def last_block(self):
         # Returns the last Block in the chain
         pass
 
 ```



**任务**：实现以上函数，完成一个最基础的Blockchain。
提交到自己的 GitHub 仓库

要求：上传运行截图或日志。


## 参考

交易结构：

```json
        {
            'sender': "8527147fe1f5426f9dd545de4b27ee00",
            'recipient': "a77f5cdfa2934df3954a5c7c7da5df1f",
            'amount': 5,
        }
```



区块结构：

```json
block = {
    'index': 1,
    'timestamp': 1506057125.900785,
    'transactions': [  // 多个交易
        {
            'sender': "8527147fe1f5426f9dd545de4b27ee00",
            'recipient': "a77f5cdfa2934df3954a5c7c7da5df1f",
            'amount': 5,
        }
    ],
    'proof': 324984774000,
    'previous_hash': "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824"
}
```



文档：https://learnblockchain.cn/2017/10/27/build_blockchain_by_python/