pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// 极简的杠杆 DEX 
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

    // 不考虑手续费
    function vAmmSwapByInput(uint inputvEth, uint inputvUSDC) internal returns (uint output) {
        if (inputvEth > 0 && inputvUSDC == 0) { // 输入为 ETH
            vETHAmount += inputvEth;
            uint vUSDCAmountlast = vUSDCAmount;
            vUSDCAmount = vK / vETHAmount;
            output = vUSDCAmountlast - vUSDCAmount;
        } else if (inputvEth == 0 && inputvUSDC > 0) {
            vUSDCAmount += inputvUSDC;
            uint vEthAmountlast = vETHAmount;
            vETHAmount = vK / vUSDCAmount;
            output = vEthAmountlast - vETHAmount;
        } else {
            revert("invalid input");
        }
    }


    function vAmmSwapByOutput(uint outputvEth, uint outputvUSDC) internal returns (uint input) {
        if (outputvEth > 0 && outputvUSDC == 0) {
            vETHAmount -= outputvEth;
            uint vUSDCAmountlast = vUSDCAmount;
            vUSDCAmount = vK / vETHAmount;
            return vUSDCAmount - vUSDCAmountlast;
        } else if (outputvEth == 0 && outputvUSDC > 0) {
            vUSDCAmount -= outputvUSDC;
            uint vEthAmountlast = vETHAmount;
            vETHAmount = vK / vUSDCAmount;
            return vETHAmount - vEthAmountlast;
        } else {
            revert("invalid outputvEth");
        }
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

        if (long) {
            pos.position = int(vAmmSwapByInput(0, amount));
        } else {
            pos.position = -1 * int(vAmmSwapByOutput(0, amount)); // 负数表示做空
        }
        
        
    }

    // 关闭头寸并结算
    // 不考虑协议亏损
    function closePosition() external {
        PositionInfo storage position = positions[msg.sender];
        require(position.position != 0, "No open position");
        
        int256 pnl = calculatePnL(msg.sender);
        
        if (position.position > 0) {
            // 做多仓位：平仓
            vAmmSwapByInput(uint256(position.position), 0);
        } else {
            // 做空仓位：平仓
            vAmmSwapByOutput(uint256(-position.position), 0);
        }
        
        // 返还保证金和盈亏
        if (pnl > 0) {
            // 盈利：返还保证金 + 盈亏
            USDC.transfer(msg.sender, position.margin + uint256(pnl));
        } else {
            // 亏损：返还保证金 - 亏损
            USDC.transfer(msg.sender, position.margin - uint256(-pnl));
        }
        
        // 清除仓位信息
        delete positions[msg.sender];
    }

    // 清算头寸， 清算的逻辑和关闭头寸类似，不过利润由清算用户获取
    function liquidatePosition(address _user) external {
        // 检查清算人不能是自己
        require(msg.sender != _user, "Cannot liquidate own position");

        PositionInfo memory position = positions[_user];
        require(position.position != 0, "No open position");
        int256 pnl = calculatePnL(_user);
        
        // 检查是否需要清算（这里简单设置为亏损超过保证金的80%时清算）
        require(pnl < -int256(position.margin * 8 / 10), "Position not liquidatable");
        
        if (position.position > 0) {
            // 做多仓位：平仓
            vAmmSwapByInput(uint256(position.position), 0);
        } else {
            // 做空仓位：平仓
            vAmmSwapByOutput(uint256(-position.position), 0);
        }
        
        // 清算人获得清算奖励（比如保证金的 5%）
        uint256 liquidationReward = position.margin * 5 / 100;

        // 返还剩余保证金给用户
        if (pnl > -int256(position.margin)) {
            USDC.transfer(_user, position.margin - uint256(-pnl) - liquidationReward);
        }

        // 给清算人转账奖励
        USDC.transfer(msg.sender, liquidationReward);
        
        // 清除仓位信息
        delete positions[_user];
    }

    // 计算盈亏： 对比当前的仓位和借的 vUSDC
    function calculatePnL(address user) public view returns (int256) {
        PositionInfo memory position = positions[user];
        if (position.position == 0) return 0;
        
        // 计算当前仓位的价值（以 USDC 计价）
        int256 currentValue;
        if (position.position > 0) {
            // 计算当前多位 ETH 价值
            uint USDCAmount = vK / (vETHAmount + uint256(position.position));
            currentValue = int256(vUSDCAmount) - int256(USDCAmount);
        } else {
            // 计算当前空仓 ETH 价值
            uint USDCAmount = vK / (vETHAmount - uint256(-position.position));
            currentValue = int256(USDCAmount) - int256(vUSDCAmount);
        }

        // 计算盈亏 = 当前价值 - 借入金额 - 保证金
        return currentValue - int256(position.borrowed) - int256(position.margin);
    }



  }
