const importWalletButton = () => {
    return ( 
        <div className="Minter">
            <button id="walletButton" onClick={connectWalletPressed}>
            {walletAddress.length > 0 ? (
                "Connected: " +
                String(walletAddress).substring(0, 6) +
                "..." +
                String(walletAddress).substring(38)
            ) : (
                <span>Connect Wallet</span>
            )}
            </button>
        </div>
    );
}
 
export default importWalletButton;