import { useState } from 'react' 
import Navbar from './Navbar';

const Game = () => {
        return ( 
            <div className ="Game">
                <header className="App-header">
                    <div id="hov_main">
                        <div id="flex" class="tall">
                            <div id="heroplayer">
                                <div id="heroget"> 
                                <p className="hovfont"> HERO </p> 
                                
                                <div id="flex"> <button className="statbutton" > getHeroLevel() </button> <p className="number" id="number"></p> </div>
                                <div id="flex"> <button className="statbutton" > getHeroStrength() </button> <p className="number" id="number"></p> </div>
                                <div id="flex"> <button className="statbutton" > getHeroSupport() </button> <p className="number" id="number"></p> </div>
                                <div id="flex"> <button className="statbutton" > getHeroLove() </button> <p className="number" id="number"></p> </div>
                                </div> 
                            </div> 
                            <div id="play"> 
                                Key ID: 0 <button className="button" > UseKey() </button>
                                <button className="button" > HeroLevel() </button>
                            </div> 
                            <div id="play">
                                <button className="buttonspecial" id="risehero"> RiseHero() </button>
                           
                        {/*     <button className="buttonspecial" > riseHeroAllies() </button>*/}

                            </div>
                        </div> 

                        {/* end hero player area    */}
                        
                        {/* begin status area       */}
                        
                        <div id="statusfunctions">  

                        <div id="heroreborn"> 
                            <div id="flexdeathleft"> 
                            <button className="statbutton" > HeroReborn() </button>
                            <p className="numberdeathleft"> 0 </p>
                            </div>
                            <div id="flexdeathright"> 
                            <button className="statbutton" > VillainReborn() </button>
                            <p className="numberdeathright"> 0 </p>
                            </div>
                        </div> 

                        <div id="status"> 
                            <br />
                            <p id="statustext"> Hero Power: 0</ p>
                            <p id="statustext"> Villain Power: 0 </p>  
                            <p id="statustext"> Vision Orb: <br /> THE HERO IS CURRENTLY MORE POWERFUL THAN THE VILLAIN! </ p>
                            <p id="statustext">  </p>  
                            
                            <br />
                        </div> 

                        <button className="button" > CallVision() </button> <br />
                        <button className="button" > ExecuteKill() </button>
                        </div> 

                        <div id="flex">      
                            <div id="flex" class="tall">

                                <div id="heroplayer">
                                    <div id="heroget"> 
                                    <p className="hovfont"> VILLAIN </p> 
                                    <div id="flex"> <button className="statbutton" > getVillainLevel() </button> <p className="number" id="number"></p>  </div>
                                    <div id="flex"> <button className="statbutton" > getVillainStrength() </button> <p className="number" id="number"></p> </div>
                                    <div id="flex"> <button className="statbutton" > getVillainSupport() </button> <p className="number" id="number"></p></div>
                                    <div id="flex"> <button className="statbutton" > getVillainLove() </button> <p className="number" id="number"></p>  </div>
                                    </div> 
                                </div>
                                <div id="play"> 
                                    <button className="button" > UseKey() </button>
                                    <button className="button" > VillainLevel() </button>
                                </div>
                                
                                <div id="play">
                                    <button className="buttonspecial" id="risevillain"> RiseVillain() </button>
                                  {/*   <button className="buttonspecial" id="rise_villain_allies"> rise_Villain_Allies() </button>   */}
                                </div>       
                            </div> 
                        </div>
                    </div>
                    
            </header>
        </div> 
     );
}
 
export default Game;
