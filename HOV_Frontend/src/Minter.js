import { useEffect, useState } from "react";
import {
  connectWallet,
  getCurrentWalletConnected,
  getFire,       
  setGameStatusContract,         
  setFireTest,        
} from "./functions.js"; 
import importWalletButton from "./Importwalletbutton.js"

///////////////////////////////////////START CONNECT WALLET [do not change]/////////////////////////////////////
const Minter = (props) => {
  const [walletAddress, setWallet] = useState("");
  const [status, setStatus] = useState("");

  useEffect(async () => {
    const { address, status } = await getCurrentWalletConnected();

    setWallet(address);
    setStatus(status);

    addWalletListener();
  }, []);

  function addWalletListener() {
    if (window.ethereum) {
      window.ethereum.on("accountsChanged", (accounts) => {
        if (accounts.length > 0) {
          setWallet(accounts[0]);
          setStatus("Ready.");
        } else {
          setWallet("");
          setStatus("🦊 Connect to Metamask using the top right button.");
        }
      });
    } else {
      setStatus(
        <p>
          {" "}
          🦊{" "}
          <a target="_blank" href={`https://metamask.io/download.html`}>
            You must install Metamask, a virtual Ethereum wallet, in your
            browser.
          </a>
        </p>
      );
    }
  }

  const connectWalletPressed = async () => {
    const walletResponse = await connectWallet();
    setStatus(walletResponse.status);
    setWallet(walletResponse.address);
  };
///////////////////////////////////////END CONNECT WALLET/////////////////////////////////////

//START 

  const [fireStatus, setFire] = useState("");
  const [fireGameStatus, fireSetGameStatus] = useState("");

  const fireme = async () => {                           
    getFire().then(function(result){
      setFire(result); //usually set JSON.stringify(result)
    });
  };
  const setFireClick = async () => {                                      
    setGameStatusContract();
  };
  const testFireClick = async () => {                                      
    setFireTest();
  };
  {/*  I could create an event and listen for that event in the GUI. 
    
    
    
    If you are issuing a transaction to the contract, 
    you will always just get a receipt as the transaction has to be first processed by the blockchain. 
    After it has been processed you can query for the result with the transaction information (web3 has some shortcuts for this).
 */}
  //fireme(); //I want this to get right on start // ends up crashing 
  return (
    //
    <div className="Minter">
      <button id="walletButton" onClick={connectWalletPressed}>
        {walletAddress.length > 0 ? (
          "Connected: " +
          String(walletAddress).substring(0, 6) +
          "..." +
          String(walletAddress).substring(35, 38)
        ) : (
          <span>Connect Wallet</span>
        )}
      </button>

      <br></br>
      <h1 id="title"> Dev Lab </h1>

      <button id="mintButton" onClick={fireme}> get fire! </button> 
      <p id="status" > 
        Hero Power: {fireStatus[0]}
        <br /> 
        Villain Power: {fireStatus[1]} {/* I ***could*** make less get functions and return them differently. 
                                         However if I did that, I wouldn't be able to call the specific functions in contracts in the future */}
        <br /> 
        {fireStatus[2]}
      </p>
      <button id="mintButton" onClick={setFireClick}> set fire! </button> 
      <p id="status" >
        {fireGameStatus}
      </p>
      <button id="mintButton" onClick={testFireClick}> test fire! </button> 
      
    </div>
  );
};

export default Minter;
