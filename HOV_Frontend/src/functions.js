import { pinJSONToIPFS } from "./util/pinata.js";
require("dotenv").config();
const alchemyKey = process.env.REACT_APP_ALCHEMY_KEY;
const contractABI = require("./hov-api.json");
const contractAddress = "0x1e1992B86325f8e0298f9632442ace434ffcd832";
const { createAlchemyWeb3 } = require("@alch/alchemy-web3");
const web3 = createAlchemyWeb3(alchemyKey);


///////////////////////////////////////START CONNECT WALLET [do not change]/////////////////////////////////////
export const connectWallet = async () => {
  if (window.ethereum) {
    try {
      const addressArray = await window.ethereum.request({
        method: "eth_requestAccounts",
      });
      const obj = {
        status: "status: beep.",
        address: addressArray[0],
      };
      return obj;
    } catch (err) {
      return {
        address: "",
        status: "😥 " + err.message,
      };
    }
  } else {
    return {
      address: "",
      status: (
        <span>
          <p>
            {" "}
            🦊{" "}
            <a target="_blank" href={`https://metamask.io/download.html`}>
              You must install Metamask, a virtual Ethereum wallet, in your
              browser.
            </a>
          </p>
        </span>
      ),
    };
  }
};
export const getCurrentWalletConnected = async () => {
  if (window.ethereum) {
    try {
      const addressArray = await window.ethereum.request({
        method: "eth_accounts",
      });
      if (addressArray.length > 0) {
        return {
          address: addressArray[0],
          status: "👆🏽 Write a message in the text-field above.",
        };
      } else {
        return {
          address: "",
          status: "🦊 Connect to Metamask using the top right button.",
        };
      }
    } catch (err) {
      return {
        address: "",
        status: "😥 " + err.message,
      };
    }
  } else {
    return {
      address: "",
      status: (
        <span>
          <p>
            {" "}
            🦊{" "}
            <a target="_blank" href={`https://metamask.io/download.html`}>
              You must install Metamask, a virtual Ethereum wallet, in your
              browser.
            </a>
          </p>
        </span>
      ),
    };
  }
};
///////////////////////////////////////END CONNECT WALLET/////////////////////////////////////
async function loadContract() {
  return new web3.eth.Contract(contractABI, contractAddress);
}

//GETSTATUS
export const getFire = async () => {
  window.contract = await new web3.eth.Contract(contractABI, contractAddress); 
  const get = window.contract.methods.getStatus().call(); 
  return get
} // ( the .then is when you call it) 
export const setGameStatusContract = async () => {
  window.contract = await new web3.eth.Contract(contractABI, contractAddress); 
  const get = window.contract.methods.setStatus().send({
      to: contractAddress,
      from: window.ethereum.selectedAddress,
    }); 
  return get
} 
export const setFireTest = async () => {                        
  window.contract = await new web3.eth.Contract(contractABI, contractAddress); 
  const transactionParameters = {
    to: contractAddress, // Required except during contract publications.
    from: window.ethereum.selectedAddress, // must match user's active address.
    data: window.contract.methods
      .setStatus()      //my function <------------------------------------------------------------------
      .send(),
  }
}







export const mainSend = async () => { // taken from video, unused and untested 
  const message = await helloWorldContract.message(); 
  console.log(message)

  const tx = await helloWorldContract.update("This is new message");
  await tx.wait(); //looks important 

  const newMessage = await helloWorldContract.message(); 
  console.log("The new message is: " + newMessage) 
  
}

//soup code FOR SEND 
//const res = await contract.methods.mintItem(numberOfSoups).send({
//  from: walletAddress,
//  value: 0,                          <--- note value and ^ from are probably all i need 
//  gasPrice: gasPrice,
//  gas: gasLimit * numberOfSoups
//});
//https://www.youtube.com/watch?v=sQJ-XQBzEuc







































//here we are. 
//now of course, 
//export const getStatus = async () => {                        
//  window.contract = await new web3.eth.Contract(contractABI, contractAddress); 

//  const transactionParameters = {
//    to: contractAddress, // Required except during contract publications.
//    from: window.ethereum.selectedAddress, // must match user's active address.
//    data: window.contract.methods
//      .getStatus()      //my function <------------------------------------------------------------------
//      .call(),
//  };

//};
    
//export const mintNFT = async (url, name, description) => {                       ////HERES THE MINTNFT FUNCTION 
//  if (url.trim() == "" || name.trim() == "" || description.trim() == "") {
//    return {
//      success: false,
//      status: "❗Please make sure all fields are completed before minting.",
//    };
//  }

  //make metadata
//  const metadata = new Object();
//  metadata.name = name;
//  metadata.image = url;
//  metadata.description = description;

//  const pinataResponse = await pinJSONToIPFS(metadata);
//  if (!pinataResponse.success) {
//    return {
//      success: false,
//      status: "😢 Something went wrong while uploading your tokenURI.",
//    };
//  }
//  const tokenURI = pinataResponse.pinataUrl;

//  window.contract = await new web3.eth.Contract(contractABI, contractAddress); //definitely important 

//  const transactionParameters = {
//    to: contractAddress, // Required except during contract publications.
//    from: window.ethereum.selectedAddress, // must match user's active address.
//    data: window.contract.methods
//      .mintNFT(window.ethereum.selectedAddress, tokenURI)
//      .encodeABI(),
//  };

//  try {
//    const txHash = await window.ethereum.request({
//      method: "eth_sendTransaction",
//      params: [transactionParameters],
//    });
//    return {
//      success: true,
//      status:
//        "✅ Check out your transaction on Etherscan: https://ropsten.etherscan.io/tx/" +
//        txHash,
//    };
//  } catch (error) {
//    return {
//      success: false,
//      status: "😥 Something went wrong: " + error.message,
//    };
//  }
//};
