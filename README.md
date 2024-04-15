# blockchain-tasks

## Part1:Tech

| 时间 | 课件                                                         | 作业                                                         |
| ---- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| W1D1 | 1. [Github Code](https://github.com/xilibi2003/blockchain)<br />2. [PDF](https://drive.google.com/file/d/1IEkJrwY6ZCzQm7Gu1DgJCMOJzKS76y7V/view?usp=sharing)<br />  | 1. [Pow 与RSA ](https://decert.me/challenge/45779e03-7905-469e-822e-3ec3746d9ece) <br /> 2. (可选) [参考代码模版](https://github.com/OpenSpace100/blockchain-tasks/tree/main/simple-blockchain-impl) 、[模拟实现最小区快链](https://decert.me/quests/ed2d8324-54b0-4b7a-9cee-5e97d3c30030) |
| W1D2 | [PDF](https://drive.google.com/file/d/1bom8Lw60ume6A5ERf0-yIdqBmLf3iVEo/view?usp=sharing) | [创建和部署第一个智能合约](https://decert.me/quests/ffadfacf-91cf-4f69-bea3-12226bb8ecca) |
| W1D3 | [PDF](https://drive.google.com/file/d/10BeY5zdTOkZT7n3oQhhM9_ZhSoq8z2s-/view?usp=sharing)、 [Code](./solidity_sample_code) | [编写一个Bank 合约 ETH, 存款， Top3](https://decert.me/quests/c43324bc-0220-4e81-b533-668fa644c1c3) |
| W1D4 | [PDF](https://drive.google.com/file/d/1iJLz_gNwgLyBo1UBiSDmAzw8Jhn7jqkM/view?usp=sharing)、[Code](./solidity_sample_code) <br /> | [用 Solidity 编写 BigBank 智能合约](https://decert.me/quests/d0600476-7ce8-4648-a1d2-58f15ebac73f) |
| W1D5 | [PDF](https://drive.google.com/file/d/1G5dIKCdP7_TpaXKf1tdzAfcDxW5ndhZO/view?usp=sharing) | [编写 ERC20 合约](https://decert.me/challenge/aa45f136-27a3-4bc9-b4f7-15308e1e0daa) <br />[编写 Token Bank](https://decert.me/quests/eeb9f7d8-6fd0-4c38-b09c-75a29bd53af3) |
|      |                                                              |                                                              |
| W2D1 | [Code](./w2_code)、[PDF](https://drive.google.com/file/d/1FoNvXZTkVCwCOxkGbROvXhXUEmH86M8G/view?usp=sharing) | 作业1：[用Token 购买 NFT(有两个题)](https://decert.me/quests/5f11aa15-b101-480b-91b5-4888b9aafdbb)<br/>作业2: [Token Hook 应用，在 Hook 中存款和购买 NFT（有3 个题）](https://decert.me/quests/96c5b386-9148-4723-bfde-b9ea71b57ec6) |
| W2D2 | [WhatIsABI.md](./ppt/01.WhatIsABI.md) <br/>[IntroductionFoundry.md](./ppt/IntroductionFoundry.md)<br/>[WhatIsEvent.md](./ppt/WhatIsEvent.md) | [利用ABI逆向解码交易数据](https://decert.me/quests/0ba0f6e3-2b87-4a9b-b3aa-ae5f323459e1) ，完成[挑战](https://decert.me/quests/0ba0f6e3-2b87-4a9b-b3aa-ae5f323459e1) |
| W2D3 | [HowToTest.md](ppt/HowToTest.md) <br/>[code](./ppt/codes/BankTest.sol) | 测试你们自己的 NFTMarket 合约：<br/>1. 测试 List 上架<br/>2. 测试 Buy 功能<br/>3. 测试  transferWithCallbak<br/>4. [完成 Foundry 基础知识挑战](https://decert.me/quests/3bca8f1f-df6b-469b-941e-79388ee280c6) |
| W2D4 | [PPT](ppt/HowToTest.md)<br/>                                 | 1. 使用Fuzz测试 Bank 合约的存款和取款功能<br/>2. 使用Fuzz测试 NFTMaket 合约的 transferWithCallbak<br/>3. 注册 [Dune](https://dune.com/home) 账号 <br/>4. 完成 [Foundry 测试挑战](https://decert.me/quests/4578ff5b-4dcb-4c28-8b5f-7456ed1ab0a4) |
| W2D5 | [PPT](ppt/CreateReactDapp.md),<br/>[Demo](ppt/codes/mybank-dapp-react) | 创建自己的NFT Market DAPP，功能：<br/>1. 链接钱包<br/>2. 可上架NFT<br/>3. 列表显示已经上架的NFT<br/>4. 可买入指定NFT<br/>5. 完成[利用Web3Modal通过JS连接到MetaMask](https://decert.me/quests/aebe24be-0bec-4c6c-bef1-22eb08817621)挑战 |
| W3D1 | [PPT](ppt/HowToScan.md)<br/>[Demo](ppt/codes/mybank-dapp-purejs) | 作业: 创建自己的NFT Market DAPP，功能：<br/>1. 链接钱包<br/>2. 可上架NFT<br/>3. 列表显示已经上架的NFT<br/>4. 可买入指定NFT<br/>5. 动态展示所有NFT Market中的 List、Buy 日志 |
| W3D2 | [PPT](ppt/HowToUseTheGraph.md)<br/>[Demo](ppt/codes/thegraph/) | 作业：将自己的NFT Market 合约部署到 sepolia 测试网络，并部署 NFT Market 的子图。<br/>可从子图中查询出某个地址的所有持有的Token Id。 |
| W3D3 | [PDF](https://drive.google.com/file/d/1AVJHrS69iokc19Y6aexe-DTtUwlk9_LQ/view?usp=sharing)、[w3_permit 合约 Code](https://github.com/OpenSpace100/blockchain-tasks/tree/main/w3_permit)、[w3_permit 前端 Code](https://github.com/OpenSpace100/viemtutorial) | 作业1: [铭文工厂](https://decert.me/quests/75782f22-edb8-4e82-9b68-0a4f46fcaadd)： <br/>作业 2：[签名用用](https://decert.me/quests/fc66ef6c-35db-4ee7-b11d-c3b2d3fa356a) |
| W3D4 | [PPT](./ppt/StateLayout.md)<br/>                             | 在NFT Market合约中使用Slot模式读取和修改Owner地址，完成[使用Solidity内联汇编修改合约Owner地址](https://decert.me/quests/163c68ab-8adf-4377-a1c2-b5d0132edc69)挑战 |
|      |                                                              |                                                              |
| W4D1 | [PDF](https://drive.google.com/file/d/19NZSCWy1i_yEkHS2wtOoyZW8rxmOMIep/view?usp=sharing) | 作业：[可升级NFT Market 合约](https://decert.me/quests/ddbdd3c4-a633-49d7-adf9-34a6292ce3a8) |
| W4D2 | [PPT: UseDune](./ppt/UseDune.md)、[PPT: Web3 connect](./ppt/Web3Connect.md) | Create [KODA NFT Token](https://etherscan.io/token/0xe012baf811cf9c05c408e879c399960d1f305903) dashboard , includes:<br/>1. total holders<br/>2. holder list<br/>3. option: Buy/Sell trades from OpenSean and Blur.<br/>4. 完成 [创建Dune交易数据面板](https://decert.me/quests/2061bded-750c-40f7-a13c-28334b26f391)挑战。<br/><br/>homework2: Use RainbowKit on your NFT Market ! |
| W4D3 | [PDF](https://drive.google.com/file/d/1s1V9B9HWCsFJ3aWiSmm-omdel84R4M0-/view?usp=sharing) | [链表](https://decert.me/quests/753d5050-e5e4-4a0d-8ad9-9ecd7e0e0788)<br />[组合使用 MerkleTree 白名单、 Permit 授权 及 Multicall](https://decert.me/quests/faa435a5-f462-4f92-a209-3a7e8fdc4d81) |
| W4D4 |                                                              |                                                              |
| W4D5 |                                                              |                                                              |
| W5D1 | [PDF](https://drive.google.com/file/d/1w40dpGf3XRzVwh9-0viw7aCtXJp9A2JV/view?usp=sharing) | [多签钱包](https://decert.me/quests/f832d7a2-2806-4ad9-8560-a27ad8570c6f) |
| W5D2 | [PDF](https://drive.google.com/file/d/1Vp0KwVAbPq-tTuvDGX5HNLd1zqMqhGzi/view?usp=sharing)<br/> | [设法取出预先部署的 Vault 合约内的所有资金](https://decert.me/quests/b5368265-89b3-4058-8a57-a41bde625f5b) |
| W5D4 | [PDF](https://drive.google.com/file/d/1lV6vmShbzWAnwgxfntQ8k-MGzBlK6XfK/view?usp=sharing) | [自动化任务转移存款](https://decert.me/quests/072fccb4-a976-4cf9-933c-c4ef14e0f6eb)  |
| W6D1 | [DeFi-StudyCase-Uniswap](https://github.com/OpenSpace100/blockchain-tasks/blob/main/ppt/DeFi-StudyCase-Uniswap.pdf) | 1. 部署自己的 Dex<br />2. NFTMarket 支持使用任意Token购买    |
| W6D2 | [DeFi-StudyCase-Compound.pdf](https://github.com/OpenSpace100/blockchain-tasks/blob/main/ppt/DeFi-StudyCase-Compound.pdf) | 1. 阅读扩展资料 https://learnblockchain.cn/article/5036 <br/>2. 给NFTMarket赋能: 支持买入NFT收入交易手续费，手续费分发给质押ETH到NFTMarket的质押者。<br/>3. 完成[用Solidity编写ETH质押挖矿合约](https://decert.me/quests/e76599d5-a30c-4678-ba92-fe43c56df1db)挑战 |
| W6D3 | [DeFi-StudyCase-DAI.pdf](https://github.com/OpenSpace100/blockchain-tasks/blob/main/ppt/DeFi-StudyCase-DAI.pdf) | [为Fair Launch 提供流动性](https://decert.me/challenge/5bdbdf3c-d357-45d5-8ce4-34ba6aeaf5a0) |
| W6D4 | [CCIP](https://img.learnblockchain.cn/pdf/Chainlink_CCIP.pdf) <br/>[答疑补充](https://drive.google.com/file/d/1BTcnDpSgL8YiKzXtreeAtnO9BWEFdM3E/view?usp=sharing)<br/> | 1. 质押 ETH 挖直接的发行的平台币 ，函数有：stake、unstake、pendingEarn <br/>2. 在之前 NFTMarket 用 Token 挂单的价格上， 通过从 ChainLink 获取 ETH 的 价格 和 从 Uniswap 获取的 Token 价格， 在前端现实 NFT 美元价格。 <br/>3. 完成[从Oracle(ChainLink)读取ETH价格](https://decert.me/quests/48e601a9-4870-452f-b474-eb47207922dc)挑战 |
| W6D5 | [PPT](https://drive.google.com/file/d/1nPvNoibjmbRvcPxJK0a0MT07vPCYe3ff/view?usp=sharing)<br/><br/> | [模拟闪电兑换套利](https://decert.me/quests/2a63cf95-43ec-42ee-975f-2b41510492cd)<br/>[设计一个看涨期权 Token](https://decert.me/quests/5725236b-4e24-4c28-be69-2509087157c4) <br/> |
| W7D1 | [FAQ](https://github.com/OpenSpace100/blockchain-tasks/blob/main/%E8%AF%BE%E7%A8%8B%E5%9B%9E%E9%A1%BE%E6%8F%90%E9%97%AE.md) |                                                              |
| W8D1 | [DAO 治理](https://drive.google.com/file/d/15WkTrQbVk46G8gblxM1mwsdss6fJFGEH/view?usp=sharing) |  [Token 投票治理 管理 Bank 资金](https://decert.me/quests/4cbe2544-6848-4881-b2f5-c4f291241621) |



## Part2:English

| 时间 | 课件                                                         |
| ---- | ------------------------------------------------------------ |
| W1D1 | 1. [Course Agenda](https://almondine-night-686.notion.site/ff03597c84fd4bcc9885c4b5669cd6af?pvs=4)<br />2. [Week1 Transcript - Ordinal Infrastructure - Bitcoin 2023](https://docs.google.com/document/d/1H4o5ptMZS0QWbr2ro9RvD6Y1dp14jIZ_VuuAsqy_3Fc/edit?usp=sharing)<br />3. [Week1Day1 Session Notes](https://docs.google.com/document/d/1mAvayC2R4A375GTVdbmFcw6VEkZFAobKb1EeDICqJDY/edit?usp=sharing)<br />4.  [Video](https://meeting.tencent.com/v2/cloud-record/share?id=6bff799c-ce09-4895-afdf-073712b9651c&from=3) (pwd: RXpM) |
| W1D2 | 1. [Week1Day2 Transcript](https://docs.google.com/document/d/1_F8MISoJK12S0c6JFzuMHs2x7r7XUS1JrCUy1aH2d9E/edit?usp=sharing)<br />2. [Week1Day2 Session Notes](https://docs.google.com/document/d/15nx8_p8nOw9E5tShMorD3Wg_UB7ToeGO7rYWOMfH8Wk/edit?usp=sharing) |
| W1D3 | [Week1Day3 Transcript](https://docs.google.com/document/d/1XhyhaCvYTRvd5qXHohWT_Bs_StHYrLPTuHxQ9WmaDdk/edit?usp=sharing)<br/>[Week1Day3 Session Notes](https://docs.google.com/document/d/1XhyhaCvYTRvd5qXHohWT_Bs_StHYrLPTuHxQ9WmaDdk/edit?usp=sharing)<br/>[Week1Day3 Topic Wrap-up](https://docs.google.com/document/d/1rINFFkJrcttiILK9H7IimIzuAHzRXCW1I7PFrSVjC_A/edit?usp=sharing) |
| W2D1 | [How we use on-chain data to make investment decisions ](https://706community.notion.site/How-we-use-on-chain-data-to-make-investment-decisions-fce38aeddb42485ba90a2a6d83789bd6)<br/>[Graph Description Examples](https://drive.google.com/file/d/17Vb2688qhfx9sfP2U3jgTrefP8PAmG-B/view?usp=sharing)<br/>[Week2Day1 Session Notes](https://docs.google.com/document/d/1DnbmvKk_O4dKVnYJkSh2a26tJY-guItlWjnfgiPlO0s/edit?usp=sharing) |
| W2D2 | [Week2Day2 Session Notes](https://docs.google.com/document/d/12LiRrzcmV3qKXX-phFLjSz0lW_YOa4-_2Ie6slXjQiU/edit?usp=sharing) |
| W2D3 | [An Overview on L2s](https://docs.google.com/document/d/1Atz4tYyUu_KkmLTZzZo_HRHPo5xygOBAnjbeAwefsFA/edit?usp=sharing) |
| W2D4 | [Solidity Interview Questions](https://docs.google.com/document/d/1vmQWBX2j1p7BvqJM79Kh817S9xy2Rjo3ibIS7tqdlhA/edit?usp=sharing) |
| W2D5 | [ETHGlobal Waterloo Demos](https://docs.google.com/document/d/1zH0HDI0Fpym8gFfTAtbfJjGT0NhJXLGkayyQ3aJ71IE/edit?usp=sharing) |
| W3D3 | [Solidity Interview Questions 中英](https://docs.google.com/document/d/1F51_cEHwtCeDgQ447BAdAqERC9JOrTNZRxO47JWpcvg/edit?usp=sharing) |
| W3D4 | [Ethereum vs Solana Transcript](https://docs.google.com/document/d/14sUljstBPFzGBf36dzTmL1-r8In4YKK6C-ubJiPhMFg/edit?usp=sharing) <br/>[Listening Cloze](https://docs.google.com/document/d/1PRnDaqN1yht8vt1llED5-SXVgHBDslL2qnvay4vl79E/edit?usp=sharing)<br/>[Web3 Bootcamp English Vocabulary](https://docs.google.com/spreadsheets/d/13wYPUcZgXYl803rAvoTYL9Q9K3X1QZIO-3Le4DPAn00/edit?usp=sharing) |
| W3D5 | [Celestia](https://docs.google.com/document/d/1x-niO0HQu3fTVL36PKzEGoCvMoTWgIY37M4EYmKTTTM/edit?usp=sharing) <br />[Listening Cloze](https://docs.google.com/document/d/1rvm2NbKuq8cRpP3UqPG8ZRdnvlLJiNwONVqVfqRYC00/edit?usp=sharing) |
| W4D1 | [Web3 Bootcamp English Vocabulary](https://docs.google.com/spreadsheets/d/13wYPUcZgXYl803rAvoTYL9Q9K3X1QZIO-3Le4DPAn00/edit?usp=sharing)<br/>[Week4Day1 Crypto News 领读](https://docs.google.com/document/d/149xNIpESAegwgnGengg-iu-f3yuFaRcqp9vKs4KDXVo/edit?usp=sharing) |
| W4D2 | [Week4Day2 Crypto News 领读](https://docs.google.com/document/d/1FGkzmWNfRGdbrvI6-5ZHmMNztEjG84LmUF7xP-_eE5I/edit?usp=sharing) |
| W4D3 | [Week4Day3 Crypto News 领读](https://docs.google.com/document/d/1RhJOvUVGOZ0WNaig5kPfiPmsQQFLBSCFwQiNIsC0ebA/edit?usp=sharing) |
| W4D4 | [Week4Day4 Crypto News 领读](https://docs.google.com/document/d/1bY3TTg_DgFttTcBzbRUVMBNpdMnOKEgKHVTNu1NBX08/edit?usp=sharing) |
| W4D5 | [Week4Day5 Crypto News 领读](https://docs.google.com/document/d/12566hSw93okjiiOw8QNWzTHto-yU7McCx6ie1os4N3s/edit?usp=sharing) |
| W5D1 | [Week5 Day1 What's Really Behind the 4-Year Crypto Cycle](https://docs.google.com/document/d/1yI-UP_mDdCvcvv7fWRb03jtY0CeCzpNBkAZECBR4RAQ/edit?usp=sharing) |
| W5D2 | [Week5 Day2 The Impact of Global Liquidity on Crypto](https://docs.google.com/document/d/1u6vcdjfy0pM-ZaxbAaySjrXYeqZ5pLk5IeSyQZ2eTHY/edit?usp=sharing) |
| W5D3 | [Week 5 Day 3 Bitcoin L2 Rollup](https://docs.google.com/document/d/1UQ745NvJT22FHElV9YWNktCJcpSU7eMH2IsHj0tHL7s/edit?usp=sharing) |
| W5D4 | [Week 5 Day 4 BitVM](https://docs.google.com/document/d/1eQ_CDdHGvvVDLUAsfBRy3AvkZzTUUQR79V5-cnVY0yA/edit?usp=sharing) |
| W6D1 | [Week 6 Day 1 BitVM 2](https://docs.google.com/document/d/1bWhm9_lrO11IHUtyu9R9Er5et6FHEOe7sec8fws70IE/edit?usp=sharing) |
| W6D2 | [Week 6 Day 2 The Bitcoin Rollup Pitch](https://docs.google.com/document/d/1oz6BhrC5f5z9aTOLEJ9ahA4vHShqUXViIJVHZyMPLiA/edit?usp=sharing) |
| W6D3 | [Week 6 Day 3 Are L2s on bitcoin’s blockchains](https://docs.google.com/document/d/1_mKIze9oRXMyMmwJrtTO-zHOsTQu5KqXsa5pbc72Cts/edit?usp=sharing) |
| W6D4 | [Week 6 Day 4 The bitcoin metaphorical bridge](https://docs.google.com/document/d/14pa84nFYMg8i8MVnm4YD0h3Gbm725RoAs82lUW35x-Q/edit?usp=sharing) |
| W6D5 | [Week 6 Day 5 Bitcoin break out](https://docs.google.com/document/d/15vXh3eTm-CO45GkOBECR0K3x5hbQPjoR082DjfWR9zw/edit?usp=sharing) |
| W7D1 | [A Technical Analysis of Bitcoin Price](https://docs.google.com/document/d/11x9sPTbFA69UYngJ0QpB50HYdKNBh1iIANq6A97lJO8/edit?usp=sharing) |
| W7D2 | [A Technical Analysis of Bitcoin Price2](https://docs.google.com/document/d/1Uhp5tJNO10229aPo4OGr-vjrMMiKV3-5g-BdCwNuGpE/edit?usp=sharing) |
| W7D3 | [Ethereum in Focus](https://docs.google.com/document/d/1LSAzq62PVzttcVqDHNk4f7srtmXRSmLREU1mOglt6w8/edit?usp=sharing) |
| W7D4 | [Breaking News about Bitcoin: ATH](https://docs.google.com/document/d/1EV8arAkSsysclhBhlqL6o5hjqCmV2uS4AeK8xQD0lIk/edit?usp=sharing) |
| W7D5 | [Bitcoin Comments: a real lack of retail dollars coming 来自散户的钱很少](https://docs.google.com/document/d/1E9KBMKVeGiM3eMX9BQqtIIvqvdgpY5lpCJcg_2g1WPs/edit?usp=sharing) |
