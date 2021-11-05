import Attention from "./attention.js";


const footer = () => {
    return ( 
        <div id="footer"> 

            <button className="statbutton"> WARNING and ATTENTION!: THE USER SHOULD UNDERSTAND THIS TECHNOLOGY BEFORE INTERACTING WITH IT! A La La La La LAaaaaa! </button><br />

        


            <br /> 
            {/* add to disclaimer: 
                The creator takes no responsibility for and has no control over another party copying my public contract, modifying it, redeploying it, and misusing it. 
                The creator does not even know what that might look like because even the creator does not understand the full capabilities and ramifications of this technology at this time.
            */}
            <br /> 
            <br /> 
            <div id="end">© Hero Or Villain Created By <a href="https://jamesbyt.es" className="navlink2" style= {{ color: "white", }}> James T. Bytes  </a> 2021 - all rights reserved</div>

        </div>
     );
}
 
export default footer;