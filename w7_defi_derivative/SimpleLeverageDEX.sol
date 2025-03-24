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
            pos.position = -1 * int(vAmmSwapByOutput(0, amount)); // 
        }
        
        
    }

    // 关闭头寸并结算
    // 不考虑协议亏损
    function closePosition() external {
        // TODO:
    }

    // 清算头寸
    function liquidatePosition(address _user) external {
        PositionInfo memory position = positions[_user];
        require(position.position > 0, "No open position");
        int256 pnl = calculatePnL(_user);

        // TODO:

        delete positions[_user];
        
    }

    // 计算盈亏： 对比当前的仓位和借的 vUSDC
    function calculatePnL(address user) public view returns (int256) {
        // TODO:

    }
}
