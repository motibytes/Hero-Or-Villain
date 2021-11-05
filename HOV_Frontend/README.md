we have successful connection. 
Now i could take code from somewhere else that it is working 












eth_call
Executes a new message call immediately without creating a transaction on the block chain.
This is one of the most commonly used API calls. It is used to read from the blockchain which includes executing smart contracts, but does not publish anything to the blockchain. This call does not consume any Ether.

Object - The transaction call object
    from: DATA, 20 Bytes - (optional) The address the transaction is sent from.
    to: DATA, 20 Bytes - The address the transaction is directed to.
    gas: QUANTITY - (optional) Integer of the gas provided for the transaction execution. 
    eth_call consumes zero gas, but this parameter may be needed by some executions. 
    gasPrice: QUANTITY - (optional) Integer of the gasPrice used for each paid gas. 
    Note: most of our users (95%+) never set the gasPrice on eth_call.
    value: QUANTITY - (optional) Integer of the value sent with this transaction
    data: DATA - (optional) Hash of the method signature and encoded parameters. For details see Ethereum Contract ABI
    
QUANTITY|TAG - integer block number, or the string "latest", "earliest" or "pending" (see the default block parameter), OR the blockHash (in accordance with EIP-1898) Note: the parameter is an object instead of a string and should be specified as: {"blockHash": "0x<some-hash>"}. Learn more here.
##############################################################################################################################################
Note: eth_call has a timeout restriction at the node level. Batching multiple eth_call together on-chain using pre-deployed smart contracts might result in unexpected timeouts that cause none of your calls to complete. Instead, consider serializing these calls, or using smaller batches if they fail with a node error code.
##############################################################################################################################################





########################################################################

# eth_getStorageAt -- looks extremely useful. though the state of the storage may not be the value 
Returns the value from a storage position at a given address, or in other words, returns the state of the contract's storage, which may not be exposed via the contract's methods.
Parameters
    DATA, 20 Bytes - address of the storage.
    QUANTITY - integer of the position in the storage.
    QUANTITY|TAG - integer block number, or the string "latest", "earliest" or "pending", see the default block parameter.
Returns
    DATA - the value at this storage position.

##################
eth_getBalance
Returns the balance of the account of a given address.

notes from alchemyies api 
eth_sendRawTransaction
Creates a new message call transaction or a contract creation for signed transactions.
Returns
DATA, 32 Bytes - the transaction hash, or the zero hash if the transaction is not yet available.

# ✅ [Completed] NFT Minter Tutorial

This project contains the COMPLETED files for [Alchemy's NFT Minter tutorial](https://docs.alchemyapi.io/alchemy/tutorials/nft-minter), in which we teach you how to connect your smart contract to your React dApp project by building an NFT Minter using Metamask and Web3. It is best used as a reference.

# 🪜 Installation
To use this minter, you'll need to do the following:

1. Run `npm install` to download the `node_modules` folder.
2. Download the [dotenv package](https://www.npmjs.com/package/dotenv) in your project directory by running `npm install dotenv --save` in your terminal
3. Create a `.env` file in the root directory this `nft-minter` by entering the following on your command line: `vim .env` and then add your [Alchemy API Key](https://docs.alchemyapi.io/alchemy/tutorials/nft-minter#create-your-alchemy-api-key) and [Pinata Key and Secret](https://pinata.cloud/keys). Altogether, your `.env` file should look like so:

```
REACT_APP_PINATA_KEY = <pinata-key>
REACT_APP_PINATA_SECRET = <pinata-secret>
REACT_APP_ALCHEMY_KEY = https://eth-ropsten.alchemyapi.io/v2/<alchemy-key>
```
4. Run `npm start`in your terminal to open the minter in your browswera at http://localhost:3000/.
