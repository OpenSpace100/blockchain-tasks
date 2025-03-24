pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// 极简的杠杆 DEX 实现， 完成 TODO 代码部分
contract SimpleLeverageDEX {

    uint public vK;  // 100000 
    uint public vETHAmount;
    uint public vUSDCAmount;

    IERC20 public USDC;  // 自己创建一个币来模拟 USDC

    struct PositionInfo {
        uint256 margin; // 保证金    // 真实的资金， 如 USDC 
        uint256 borrowed; // 借入的资金
        int256 position;    // 虚拟 eth 持仓
    }
    mapping(address => PositionInfo) public positions;

    constructor(uint vEth, uint vUSDC) {
        vETHAmount = vEth;
        vUSDCAmount = vUSDC;
        vK = vEth * vUSDC;

    }


    // 开启杠杆头寸
    function openPosition(uint256 _margin, uint level, bool long) external {
        require(positions[msg.sender].position == 0, "Position already open");

        PositionInfo storage pos = positions[msg.sender] ;

        USDC.transferFrom(msg.sender, address(this), _margin); // 用户提供保证金
        uint amount = _margin * level;
        uint256 borrowAmount = amount - _margin;

        pos.margin = _margin;
        pos.borrowed = borrowAmount;

        // TODO:
        if (long) {
            pos.position =  
        } else {
            pos.position =  
        }
        
    }

    // 关闭头寸并结算, 不考虑协议亏损
    function closePosition() external {
        // TODO:
    }

    // 清算头寸， 清算的逻辑和关闭头寸类似，不过利润由清算用户获取
    // 注意： 清算人不能是自己，同时设置一个清算条件，例如亏损大于保证金的 80%
    function liquidatePosition(address _user) external {
        PositionInfo memory position = positions[_user];
        require(position.position != 0, "No open position");
        int256 pnl = calculatePnL(_user);

        // TODO:

        delete positions[_user];
        
    }

    // 计算盈亏： 对比当前的仓位和借的 vUSDC
    function calculatePnL(address user) public view returns (int256) {
        // TODO:

    }
}
