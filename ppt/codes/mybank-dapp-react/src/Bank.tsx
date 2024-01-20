
// Import everything
import { ethers } from "ethers";

import { useState, useEffect } from 'react'
import bankABI from "./utils/bigbank.json"

// 请替换成BANK合约地址
const bankAddress = "0x163420Fa9f9A12C34f2728e40D32b6aA0385778e"

interface WalletState { signer: ethers.JsonRpcSigner | null, chainId: string, balance: number | string }
const Bank = () => {

    // ethers.JsonRpcSigner 
    const [hasProvider, setHasProvider] = useState<boolean | null>(null)
    var walletInitstate: WalletState = { signer: null, chainId: "", balance: "" }
    const [wallet, setWallet] = useState<WalletState>(walletInitstate)

    const [bankContract, setBankContract] = useState<ethers.Contract | null>(null)

    const [bankInfo, setBankInfo] = useState<string>("");
    const [top3Address, setTop3] = useState<string[]>([]);


    useEffect(() => {

        const update = async () => {

            if (window.ethereum) {
                let provider = new ethers.BrowserProvider(window.ethereum)
                let signer = await provider.getSigner()
                updateAccount(signer)
            }
        }

        update()



    }, [])

    const updateAccount = async (signer: ethers.JsonRpcSigner) => {
        setWallet({ signer, chainId: "0", balance: "0" });
        refreshWallet()
    }

    const refreshWallet = async () => {
        const signer = wallet.signer!;
        // chainId 
        let network = await signer.provider.getNetwork()
        let chainId = network.chainId.toString()
        const who = signer.address
        const balance = ethers.formatUnits(
            (await signer.provider.getBalance(who, "latest")), "ether")
        setWallet({ signer, chainId, balance });
        const contract = new ethers.Contract(bankAddress, bankABI, signer)

        setBankContract(contract)
        refreshBank()


        // 读取前三存款
        const top3 = await contract.viewTopThree() // staticcall
        setTop3(top3)

        console.log("done!")
    }

    const handleConnect = async () => {
        // const  provider = ethers.getDefaultProvider("mainnet")

        let provider = new ethers.BrowserProvider(window.ethereum)
        let signer = await provider.getSigner()

        updateAccount(signer)
    }

    const refreshBank = async () => {
        if (!wallet.signer) return;
        const who = await wallet.signer?.address;
        // 查询在Bank中的存款额
        const value = await bankContract?.balanceOf(who)
        console.log(value);
        const depositBalance = ethers.formatEther(value.toString())
        setBankInfo(depositBalance.toString())

    }

    const handleDeposit = async () => {

        // bankContract.
        const amount = ethers.parseUnits("0.01", "ether")   // 0.01 *1e18
        let tx = await bankContract?.depositETH({ value: amount })


        console.log(tx)

        const receipt = await tx.wait();

        console.log(receipt)

        // 交易成功后更新数据
        refreshWallet();
    }


    const handleWithdraw = async () => {

        // 执行请求
        let tx = await bankContract?.userWithdraw()
        console.log(tx)

        // 等待交易被Mint
        const receipt = await tx.wait();
        console.log(receipt)
        // 交易成功后更新数据
        refreshWallet()
    }


    const handleRefresh = async () => {

        refreshWallet()
    }


    return (
        <>
            <div>
                <h1>Bank</h1>

                <button onClick={handleConnect}>Connect wallet</button>

                {wallet.signer &&
                    <>
                        <div>
                            <div>Wallet: {wallet.signer.address} </div>
                            Balance: {wallet.balance} <br />
                            ChainId: {wallet.chainId} <br />

                        </div>
                        <div>
                            Your balance: {bankInfo} ETH
                        </div>
                        <button onClick={handleDeposit}>Deposit</button>

                        <button onClick={handleWithdraw}>Withdraw</button>

                        <button onClick={handleRefresh}>Refresh</button>
                    </>
                }

                <br/>
                <span>Top3</span>
                <ol>
                    {top3Address.map((value) => {
                        return (
                            <>
                                <li>{value}</li>
                            </>

                        )

                    })
                    }
                </ol>
            </div>
        </>
    )
}

export default Bank;