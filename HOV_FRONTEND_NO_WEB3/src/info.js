const info = () => {
    return ( 
        
        <div id="info">
            <div id="wardiv">
            
            <p id="war">  
            <h1 id="wartitle"> - the rules of war - </h1> 
                <div id="rules">
                &nbsp;	&nbsp;&nbsp;	&nbsp;
                    &nbsp;	&nbsp;	
                  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// <br />
                  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// <br />
                  //- I.    The 'resolved' state of the game is peace. -<br />
                  //- II.   The 'game' is a public war with two public sides. <br />
                  //- III.  The 'rise' function increases your side's strength by current level.<br />
                  //- IV.   The side with more power is 'winning'. <br />
                  //- V.    Power is calculated by [strength * level] + [support / 1000].<br />
                  //- VI.   Player's total contributions to each side are saved as love points. <br />
                  //- VII.  Payable LevelUp functions will add one level to your chosen side. <br />
                  //- VIII. Player can run getStatus() to find out the current results without writing state changes, requiring no gas. <br />
                  //- IX.   setStatus() will calculate and write the outcome of the game: <br />
                  //- &nbsp;	&nbsp;      i. If one side's power is 2 times greater than the other, the greater side will gain one kill. <br />
                  //- &nbsp;	&nbsp;      ii. The fallen side will resurrect, and their level will rise to equal the level of the opponent. <br />
                  //- &nbsp;	&nbsp;      iii. revise<br />
                  //- &nbsp;	&nbsp;      iv.  revise  <br />
                  //- X.    A player can play both sides. <br />
                  //  <br />
                  //- XI. 'Metagame' 'Ready Player X' Functions: <br />
                  //- &nbsp;	&nbsp;       i. If player pays fee for setLevel() functions, players team will permanently level up<br />
                  // &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; [affecting 'rise()' function interactions of all players] <br />
                  //- &nbsp;	&nbsp;       ii. If [an nft ally contract exists and ] the player's address holds an nft from the ally contract,  <br />
                  // &nbsp;	&nbsp;  &nbsp;	'rise()' functions will multiply added strength by 4.  <br />
                  //- &nbsp;	&nbsp;       iii. If [a nft key contract exists and] the player's address holds an NFT "Key" from the contract, <br />
                  // &nbsp;	&nbsp;  &nbsp;player can call 'Use_Key()' functions, waiving fee and permanently leveling up player's team <br />
                  // &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp; &nbsp;	&nbsp;[affecting 'rise()' function interactions of all players]<br />
                  //      <br />
                  //    
                  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                      <br />
                      </div>

                   
            </p>
            </div>
        </div>
     );
}
 
export default info;