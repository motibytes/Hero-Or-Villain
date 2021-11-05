import './index.css';


const About = () => {
    return (  
        
        <div className="aboutall">
            <div className="about">
      {/*      Add a rephrased write up from what I posted to twitter about the game here.  <br />   */}
              <h2>game </h2>
              <a href="https://polygonscan.com/" className="navlinkexternal" style= {{
                }}>  // View Contract on PolygonScan //</a> 
                 <br />     
                 <a href="https://polygonscan.com/" className="navlinkexternal" style= {{
                }}>  // beep //</a> 
                 <br />        
              <h2> Resources </h2> 
                <a href="https://polygonscan.com/" className="navlinkexternal" style= {{
                    }}>  // How to connect Metamask to Polygon 'Matic Mainnet' - Medium Article //</a> 
                <br />                     
                <a href="https://wallet.polygon.technology/bridge" className="navlinkexternal" style= {{
                    }}>//  Ethereum 'Mainnet' to 'Matic' Polygon Bridge //</a> 
                <br /> 
                <a href="https://medium.com/stakin/bridging-to-matic-network-from-ethereum-chain-a1b59a64a7ce" className="navlinkexternal" style= {{
                    }}>// Bridging to Matic Network from Ethereum chain - Medium Article //</a> 
                <br /> 

                <h2> Community </h2>
                

                
                <a href="https://discord.gg/dYApub3mMf" className="navlinkexternal" style= {{
                }}> // Join the War in the Official Discord Community! // </a>
                
                <br /> 
                <br />
                <a href="https://twitter.com/0xdivi?ref_src=twsrc%5Etfw" className="navlinkexternal" >// follow @0xdivi on twitter // </a>
{/*
                <a className="navlinkexternal" href="https://twitter.com/0xdivi?ref_src=twsrc%5Etfw" class="twitter-follow-button" data-show-count="false">follow @0xdivi</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                 */}
                <br /><br />  
                For all inquiries contact @0xdivi on twitter. 
                <br />
                <br />
                <p> Thank You for Playing! <span id="videogame" > ❤️ </span> </p>
            </div>
        </div>
        
    );
}
 
export default About;