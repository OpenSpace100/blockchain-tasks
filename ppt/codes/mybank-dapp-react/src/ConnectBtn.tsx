import { useState, useEffect } from 'react'

import detectEthereumProvider from '@metamask/detect-provider'

const ConnectBtn = () => {

    const [hasProvider, setHasProvider] = useState<boolean | null>(null)
    var walletInitstate={ accounts: [],chainId:"",balance:0.0 }
    const [wallet, setWallet] = useState(walletInitstate)

    const refreshAccounts = (accounts: any) => {               
      if (accounts.length > 0) {                               
        updateAccount(accounts)                                 
      } else {                                                 
        // if length 0, user is disconnected                   
        setWallet(walletInitstate)                                
      }                                                        
    }  
    const refreshChain = (chainId: any) => {               /* New */
        setWallet((wallet) => ({ ...wallet, chainId }))      /* New */
    }   
    // 组件的生命周期，当前组件重新绘制的时候，有一个环节是执行 useEffect
    useEffect(() => {
        const getProvider = async () => {
            const provider = await detectEthereumProvider({ silent: true })
            console.log(provider)
            setHasProvider(Boolean(provider)) // transform provider to true or false

            if (provider) {
                const accounts= await  window.ethereum.request({
                    method:"eth_accounts"
                })
                updateAccount(accounts) 
                window.ethereum.on('accountsChanged', refreshAccounts)
                window.ethereum.on("chainChanged", refreshChain) 
            }
        }

        getProvider()
    }, [])

    const updateAccount =async (list: any) => {

        // chainId
        const chainId = await window.ethereum!.request({                
            method: "eth_chainId",                                        
        }) 
        const balance = await window.ethereum.request({
            method: "eth_getBalance",
            params:[ list[0], "latest" ]
        })

        
        setWallet({ accounts: list,balance:parseInt(balance)/1000000000000000000.0,chainId });
        console.log(list);
    }

    const handleConnect = async () => {

        window.ethereum.request({
            method: "eth_requestAccounts"
        }).then((accounts: any) => {
            updateAccount(accounts)
        }).catch((err: any) => {
            alert(err.message);
        })
    }


return (
    <>
        {!hasProvider &&
            <>
                <div>
                    Please install metamask wallet!
                </div>
            </>
        }
        {hasProvider &&
            <button onClick={handleConnect}>Connect metamask </button>
        }

        {wallet && wallet.accounts.length > 0 && 
            <>
            <div>
                Wallet: {wallet.accounts[0]}<br />
                Balance: {wallet.balance} <br />
                ChainId: {wallet.chainId} <br />
            </div>
            </>
        }


    </>
)
}

export default ConnectBtn;