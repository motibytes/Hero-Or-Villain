/**  
    @title Hero Or Villain 2 
    @author 0xdivi✨
    @notice The World's First Public Text-based Blockchain Wargame 
    @notice SPDX-License-Identifier: UNLICENSED

    @notice 

    Public Domain Release Update: 
    On 1/7/2024 I release all claim to this code, that it be available to the public domain. 
    By the power of the Word as is mine by Divine Right, I declare that anyone who attempts to use this code with malicious intent or any evil purposes will crumble. Their project will not work and the results will return to sender. 

    @notice HERO OR VILLAIN is not audited or financially insured in any way. Interaction with this contract is entirely at your own risk. 
    @notice There is no financial gain or financial incentive for the user and no reason at all to invest money into this gamified contract. 
    @notice 
    
    Hero Or Villain is a smart contract on a blockchain that is decentralized with public functions, 
    meaning that this is a project that anyone can participate in. 
    This is a game and social experiment allowing anyone to support either side. 
    At its core, players level up the power of their side by calling a function that rises their strength stat, 
    and if one side can overpower the other, the opposing side enters a vulnerable state in which the stronger side can execute kills. 
    
    The game's logic affects the game on a more advanced level. For example, it would require some coordination for a team to operate effectively. 
    This is because if a team were to raise their strength stat too high, the weaker side could actually gain kills instead! 
    A multiplayer game with anonymous players makes the tactics involved to remain the stronger force is unprecedented. 
    Another consideration is that rising the strength stat of the opposing team could actually work in your team's favor. 
    Yet another consideration is how transactions function on the blockchain itself in relation to time. 

    How this game will perform on the blockchain is unknown even to the developer. 
    After deployment, there is no developer control over the core of the game or ability to shut it down. 

    A sample of the game's logic: 

    if hero is greater than villain * 2 
    hero kills villain 
    and if hero is greater than villain * 4 
        then villain * 8
        if villain is greater than hero * 2 
            then villain kills hero
    
    @notice 
                        - HERO OR VILLAIN 2 -  

    I.    The 'resolved' state of the game is peace. 
    II.   This game is a public war with two public sides. 
    III.  The 'rise' function increases your side's strength by current level.
    IV.   The side with more power is 'winning'. 
    V.    Power is calculated by [strength * level] + [support / 1000].
    VI.   Player's total contributions to each side are saved as love points. 
    VII.  Payable LevelUp functions will add one level to your chosen side. 
    VIII. Player can run visionOrb() to find out the current results without writing state changes, requiring no gas. 
    IX.   executeKill() will calculate and write the outcome of the game: 
        i. If one side's power is 2 times greater than the other, the greater side will gain one kill. 
        ii. The fallen side will resurrect, and their level will rise to equal the level of the opponent. 
        iii. If one side's power is 4 times greater than the other, the opposing side will be supported by supernatural power with a x8 multiplier. 
        iv. If the former side's power is any greater than the opposing side with the x8 multiplier, the opposing side will die. 
        v. If the side with the x8 multiplier's power is 2 times greater than the opposite side, the opposite side will die. 
    X.    A player can play both sides. 
    XI. All potential exploits to game mechanics are encouraged. There are no rules in war. 
   
    XI. 'Metagame' 'Ready Player X' Functions: 
        i. If player pays fee for setLevel() functions, players team will permanently level up [affecting 'rise()' function interactions of all players]
        ii. If [an nft ally contract exists and ] the player's address holds an nft from the ally contract, 'rise()' functions will multiply added strength by 4. 
        iii. If [a nft key contract exists and] the player's address holds an NFT "Key" from the contract, player can call 'Use_Key()' functions, 
        waiving fee and permanently leveling up player's team [affecting 'rise()' function interactions of all players]
    
    This work is considered finished and complete as is. Future versions of this game adding additional weight and functionality are a strong possibility. For all updates see @0xdivi on twitter. 
    
    Thank You for Playing! 
import "@openzeppelin/contracts/access/Ownable.sol";

    @notice created 2021 
*/ 

//set_Hero_Ally_Name // this is only owner 
// set_Hero_Allies // this is only owner 
//set_The_Key // this is only owner 
//a_visionOrb // unnecessary 
//calcHeroPower // unnecessary internal 
//calcVillainPower  // unnecessary internal 

//////////////////////////////////////////////////////////////////
///@dev execute_Kill  event battle echos

//rise_Hero_Allies // event 
//rise_Villain_Allies // event 
//rise_Hero // event 
//rise_Villain  // event 
// hero_Use_Key //event 
// villain_Use_Key // event 
// buyVillainLevel // event 
// buyHeroLevel  // event 
//setHero_Reborn // this is emitted by battle echos. should i have an additional event?  
//setVillain_Reborn // ? 

//Battle_Echos(_hero_power, _villain_power, status, death, reborn); ///@dev event

pragma solidity ^0.8.0;

interface heroOne
{
    function ownerOf (uint256 tokenid) external view returns (address);
    function heroallies (uint256 tokenid) external view returns (string memory);
    function tokensOfOwner(address owner) external view returns (uint256[] memory);
}
interface villainOne
{
    function ownerOf (uint256 tokenid) external view returns (address);
    function villainallies (uint256 tokenid) external view returns (string memory);
    function tokensOfOwner(address owner) external view returns (uint256[] memory);
}

interface theKeyInterface
{
    function ownerOf (uint256 tokenid) external view returns (address);
    function thekey (uint256 tokenid) external view returns (string memory);
    function tokensOfOwner(address owner) external view returns (uint256[] memory);
}

contract Greeter {
    address payable public _owner;
    
    event CaretakerLovedByVillain(address indexed caretaker, uint256 indexed amount); 
    event CaretakerLovedByHero(address indexed caretaker, uint256 indexed amount); 
    event Battle_Echos(
        uint _hero_power, 
        uint _villain_power, 
        string status, 
        string death, 
        string reborn
    );

    uint256 internal heroLevel;
    uint256 internal heroReborn;
    uint256 internal heroStrength;
    uint256 internal heroSupport;  
    uint256 internal villainLevel;
    uint256 internal villainReborn;
    uint256 internal villainStrength;
    uint256 internal villainSupport;
    string internal hero_Ally_Name;
    string internal villain_Ally_Name;    
    mapping (address => uint256) public herolove; ///@dev user total points hero 
    mapping (address => uint256) public villainlove; ///@dev user total points villain

    uint levelUpFee = 2 ether;

    modifier onlyOwner() {
        require(msg.sender == _owner, "You are not the owner of this contract.");
        _;
    }

    //string internal name; yeah looks like i was playing with making a name function aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

    //    name = "";
    //} 
    constructor() {
        _owner = payable(msg.sender);
        heroLevel = 1; 
        heroReborn = 0; ///@dev total deaths hero
        heroStrength = 0; /// @dev strength x level  
        heroSupport = 0; ///@dev total interactions hero  
        villainLevel = 1; 
        villainReborn = 0;
        villainStrength = 0;
        villainSupport = 0;     
        hero_Ally_Name = ""; 
        villain_Ally_Name = "";
    }
  
    ////////////////////////////////////
    ///@dev 'Ready Player X' functions   
    ////////////////////////////////////

    address public hero_ally = 0x0000000000000000000000000000000000000000;    
    heroOne heroonecontract = heroOne(hero_ally);

    function set_Hero_Ally_Name(string memory newname) onlyOwner public {
        hero_Ally_Name = newname;
    }
    function set_Hero_Allies(address newaddress) onlyOwner public {
        hero_ally = newaddress;
    }
    function rise_Hero_Allies(uint256 _tokenId) public { 
        require(heroonecontract.ownerOf(_tokenId) == msg.sender);  
        heroStrength += mul(heroLevel, 4); 

    }

    address public villain_ally = 0x0000000000000000000000000000000000000000;    
    villainOne villainonecontract = villainOne(villain_ally);

    function set_Villain_Ally_Name(string memory newname) onlyOwner public {
        villain_Ally_Name = newname;
    }
    function set_Villain_Allies(address newaddress) onlyOwner public {
        villain_ally = newaddress;
    }
    function rise_Villain_Allies(uint256 _tokenId) public { 
        require(villainonecontract.ownerOf(_tokenId) == msg.sender);  
        villainStrength += mul(villainLevel, 4); 
    }

    address public the_key = 0x0000000000000000000000000000000000000000;    
    theKeyInterface theKeyContractAddress = theKeyInterface(the_key);


    function set_The_Key (address newkey) onlyOwner public {
          the_key = newkey;
    }    
    
    ///@dev """Enter your address in https://etherscan.io/ and copy the uppercase/lowercase checksummed version and paste it into your solidity code.
    ///@dev And the warning message will disappear. The compiler checks the checksummed address for validity."""" -stack overflow 
    
    ///@dev Love is user's total points for using 'rise' functions
    function addLoveHero(address caretaker, uint256 amount) internal { 
        herolove[caretaker] += amount;  
        emit CaretakerLovedByHero(caretaker, amount);
    }
    function addLoveVillain(address caretaker, uint256 amount) internal { 
        villainlove[caretaker] += amount; 
        emit CaretakerLovedByVillain(caretaker, amount);
    }   

    ///  @dev add Level to Strength, add 1 love point to user 
    function rise_Hero() public {
        heroStrength += heroLevel;
        heroSupport++;    
        addLoveHero(msg.sender, 1); 
    }
    function rise_Villain() public {
        villainStrength += villainLevel;
        villainSupport++;     
        addLoveVillain(msg.sender, 1); 
    }    
    
    function a_visionOrb() public view returns (string memory, string memory, string memory, string memory, string memory) {
        string memory status = "The battlefield is silent."; 
        
        uint256 _hero_power = calcHeroPower();              
        uint256 _villain_power = calcVillainPower();      

        string memory death = "";
        string memory reborn = "";

        if (_hero_power == 0 && _villain_power == 0) {
            status = "The battlefield is silent. In the future, I see a game beginning, a game that brings about only death.";
        }
        else if (_hero_power > _villain_power) {
            status = "The Hero Overpowers the Villain. Congratulations Team Heroic! Aha Ha!";
        }
        else if (_villain_power > _hero_power) {
            status = "The Villain Overpowers the Hero. Congratulations Team Villainic! Mua Ha!";
        }
        else { 
            status = "I hear a silent battlefield. For a moment, I feel peace. There will be no death in this battle. You have won an impossible game. "; 
        }
        
        uint256 _vp = mul(_villain_power, 2);  
        uint256 _hp = mul(_hero_power, 2); 
        
        uint256 _vp4 = mul(_villain_power, 4);  
        uint256 _hp4 = mul(_hero_power, 4); 

           if (_hero_power > _vp) { ///@dev if hero's power is greater than the villains power multiplied by two 
            status = "The Vision has Changed. The Hero has become Overwhelmingly Powerful. Upon Battle, the Villain will certainly Die. Team Heroic Can Execute Kills!";

            if (_hero_power > _vp4) {   ///@dev check if hero is 4 times stronger than hero.
                reborn = "The Vision Has Changed. Overpowered, Team Villainic will shout out for support. Dark armies of old will hear Villainic's cries and come to lend their power, multiplying Villainic power by 4.";   
                _villain_power = mul(_villain_power, 8); ///@dev villain x8 power
                if (_hero_power > _villain_power) {
                    death = "The Vision has Changed. Even the dark armies of old are not enough to stop the Hero. Team Heroic Can Execute Kills! Congratulations! Then, a thousand years later, the Villain will be reborn! The Villain will return, leveled up to the level of the Hero!";  
                }
                else if (_villain_power > _hp) { ///@dev recalculate the winner
                    death = "The Vision has Changed. The Overwhelming Power of the Villain's armies will overpower the Hero's forces. The Hero will certainly die! Do not be mistaken, Team Villainic Can Execute Kills! Congratulations! Then, a thousand years later, the Hero will be reborn! The Hero will return, leveled up to the level of the Villain!";  
                }
                else { 
                    death = "The Vision has Changed. The support of Team Villainic's Armies will allow Villainic to survive the battle.";  
                }

            }    
            else { 
                reborn = "However, ten thousand years later, the Villain will be reborn! The Villain will return, leveled up to the level of the Hero!";   
            }
        }             

        else if (_villain_power > _hp) {   
            status = "The Vision has Changed. The Villain has become Overwhelmingly Powerful. Upon Battle, the Hero will certainly Die. Team Villainic Can Execute Kills!"; 
            if (_villain_power > _hp4) {  
                reborn = "The Vision Has Changed. Overpowered, Team Heroic will shout out for support. Light armies of old will hear Heroic's cries and come to lend their power, multiplying Heroic power by 4.";  
                _hero_power = mul(_hero_power, 8);  
                if (_villain_power > _hero_power) {
                    death = "The Vision has Changed. Even the light armies of old are not enough to stop the Villain. Team Villainic Can Execute Kills! Congratulations! Then, a thousand years later, the Villain will be reborn! The Villain will return, leveled up to the level of the Hero!";  
                }
                else if (_hero_power > _vp) {  
                    death = "The Vision has Changed. The Overwhelming Power of the Hero's armies will overpower the Villain's forces. The Villain will certainly die! Do not be mistaken, Team Heroic Can Execute Kills! Congratulations! Then, a thousand years later, the Villain will be reborn! The Villain will return, leveled up to the level of the Hero!";  
                }
                else { 
                    death = "The Vision has Changed. The support of Team Heroic's Armies will allow Heroic to survive the battle.";  
                }
            }    
            else { 
                reborn = "However, ten thousand years later, the Hero will be reborn! The Hero will return, leveled up to the level of the Villain!";   
            }
        }
        else { 
            death = ""; 
            reborn = ""; 
        }         
        return (uint2str(_hero_power), uint2str(_villain_power), status, reborn, death); 
    }
    // rewrite all of this present tense

    function execute_Kill() public {
        string memory status = "The battlefield is silent."; 
        
        uint256 _hero_power = calcHeroPower();              
        uint256 _villain_power = calcVillainPower();      
        
        string memory death = "";
        string memory reborn = "";

        if (_hero_power == 0 && _villain_power == 0) {
            status = "The battlefield is silent. ";
        }
        else if (_hero_power > _villain_power) {
            status = "The Hero Overpowers the Villain. ";
        }
        else if (_villain_power > _hero_power) {
            status = "The Villain Overpowers the Hero. ";
        }
        else { 
            status = "I hear a silent battlefield. For a moment, I feel peace. There will be no death in this battle. You have won an impossible game. "; 
        }
        
        uint256 _vp = mul(_villain_power, 2);  
        uint256 _hp = mul(_hero_power, 2); 
        
        uint256 _vp4 = mul(_villain_power, 4);  
        uint256 _hp4 = mul(_hero_power, 4); 

        if (_hero_power > _vp) { 
            status = " The Hero has become Overwhelmingly Powerful. Upon Battle, the Villain will certainly Die. Team Heroic Can Execute Kills!";

            if (_hero_power > _vp4) {   
                reborn = "Overpowered, Team Villainic will shout out for support. Dark armies of old will hear Villainic's cries and come to lend their power, multiplying Villainic power by 4.";   
                _villain_power = mul(_villain_power, 8);
                if (_hero_power > _villain_power) {
                    death = "Even the dark armies of old are not enough to stop the Hero. Team Heroic Can Execute Kills! Congratulations! Then, a thousand years later, the Villain will be reborn! The Villain will return, leveled up to the level of the Hero!";  
                    setVillain_Reborn(); 
                }                
                else if (_villain_power > _hp) { 
                    death = "The Overwhelming Power of the Villain's armies will overpower the Hero's forces. The Hero will certainly die! Do not be mistaken, Team Villainic Can Execute Kills! Congratulations! Then, a thousand years later, the Hero will be reborn! The Hero will return, leveled up to the level of the Villain!";  
                    setHero_Reborn();
                }
                else { 
                    death = "The Vision has Changed. The support of Team Villainic's Armies will allow Villainic to survive the battle.";  
                }
                
            }    
            else { 
                reborn = "However, ten thousand years later, the Villain will be reborn! The Villain will return, leveled up to the level of the Hero!";  
                setVillain_Reborn(); 
            }
        }             

        else if (_villain_power > _hp) {   
            status = "The Vision has Changed. The Villain has become Overwhelmingly Powerful. Upon Battle, the Hero will certainly Die. Team Villainic Can Execute Kills!"; 
            if (_villain_power > _hp4) {  
                reborn = "The Vision Has Changed. Overpowered, Team Heroic will shout out for support. Light armies of old will hear Heroic's cries and come to lend their power, multiplying Heroic power by 4.";  
                _hero_power = mul(_hero_power, 8);  
                if (_villain_power > _hero_power) {
                    death = "The Vision has Changed. Even the light armies of old are not enough to stop the Villain. Team Villainic Can Execute Kills! Congratulations! Then, a thousand years later, the Villain will be reborn! The Villain will return, leveled up to the level of the Hero!";  
                }
                else if (_hero_power > _vp) {  
                    death = "The Vision has Changed. The Overwhelming Power of the Hero's armies will overpower the Villain's forces. The Villain will certainly die! Do not be mistaken, Team Heroic Can Execute Kills! Congratulations! Then, a thousand years later, the Villain will be reborn! The Villain will return, leveled up to the level of the Hero!";  
                    setVillain_Reborn();
                }
                else { 
                    death = "The Vision has Changed. The support of Team Heroic's Armies will allow Heroic to survive the battle.";  
                }
            }    
            else { 
                reborn = "However, ten thousand years later, the Hero will be reborn! The Hero will return, leveled up to the level of the Villain!";
                setHero_Reborn();   
            }
        }
        else { 
            death = ""; 
            reborn = ""; 
        }         
        emit Battle_Echos(_hero_power, _villain_power, status, death, reborn); ///@dev event
    }

    ///@dev reborn counter + 1, level rises to opponents level 
    function setHero_Reborn() internal { 
        heroReborn++; 
        if (heroLevel < villainLevel) {
            heroLevel = villainLevel;
        }
    }
    function setVillain_Reborn() internal { 
        villainReborn++; 
        if (villainLevel < heroLevel) {
            villainLevel = heroLevel;
        }
    }
    
    //function changeName(uint256 tokenId, string memory newName) onlyOwner public {
        //tokenIdToStat[tokenId] = newStats; what in the fucking fuck is this line aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        //I must have been trying to add a special function here 
    //    setName(tokenId, newname);
    //}
    //function setName(string memory newname) internal {
    //    name = newname;
    //}

 
    ///@dev calculate power: (level x strength) + (support / 1000)
    ///@return returns power         
    function calcHeroPower() internal view returns (uint256) { 
        uint256 _herolevel = getHeroLevel();  
        uint256 _herostrength = getHeroStrength();  
        uint256 _heroSupport = getHeroSupport();
        uint256 _hero_power = add(mul(_herostrength, _herolevel), div(_heroSupport, 1000));  
        return _hero_power; 
    }
        
    function calcVillainPower() internal view returns (uint256) {  
        uint256 _villainlevel = getVillainLevel();  
        uint256 _villainstrength = getVillainStrength();
        uint256 _villainsupport = getVillainSupport();
        uint256 _villain_power = add(mul(_villainstrength, _villainlevel), div(_villainsupport, 1000)) ;
        return _villain_power;  
    }   
   //////////////////////////////////////////////////////////////////////////////////
   ///@dev 'ready player one' pay to win functions, if fee paid, increase level by 1 
   /////////////////////////////////////////////////////////////////////////////////

    function hero_Use_Key(uint256 _tokenId) external returns (string memory) {  ///@dev bypass pay if user holds key 
        require(theKeyContractAddress.ownerOf(_tokenId) == msg.sender);
        heroLevel++; 
        string memory message = "Your Key Has Been Confirmed, You Are Authenticated. Hero Level has risen by 1!"; 
        return message;
    }
    function buyHeroLevel() external payable returns (string memory) { 
        require(msg.value == levelUpFee, "Insufficient funds to buy a level.");
        heroLevel++; 
        string memory message = "Hero Level has risen by 1!"; 
        return message;
    }
    function villain_Use_Key(uint256 _tokenId) external returns (string memory) {  ///@dev bypass pay if user holds key 
        require(theKeyContractAddress.ownerOf(_tokenId) == msg.sender);
        villainLevel++; 
        string memory message = "Your Key Has Been Confirmed, You Are Authenticated. Villain Level has risen by 1!"; 
        return message;
    }
    function buyVillainLevel() external payable returns (string memory) {
        require(msg.value == levelUpFee, "Insufficient funds to buy a level.");
        villainLevel++; 
        string memory message = "Villain Level has risen by 1!"; 
        return message;
    }    
    
    /// @dev get functions 
    function getHeroReborn() public view returns (uint256) { 
        return heroReborn; 
    }
    function getVillainReborn() public view returns (uint256) { 
        return villainReborn; 
    }  
    function getHeroLevel() public view returns (uint256) { 
        return heroLevel; 
    }
    function getHeroStrength() public view returns (uint256) { 
        return heroStrength; 
    }
    function getHeroSupport() public view returns (uint256) { 
        return heroSupport; 
    }  
    function getVillainLevel() public view returns (uint256) { 
        return villainLevel;   
    }
    function getVillainStrength() public view returns (uint256) {  
        return villainStrength; 
    }        
    function getVillainSupport() public view returns (uint256) { 
        return villainSupport;
    }

    // get data strings for UI output 
    function getHero_Level_Strength_Support() public view returns (string memory, string memory, string memory) {
        return (uint2str(heroLevel), uint2str(heroStrength), uint2str(heroSupport)); 
    }
    function getVillain_Level_Strength_Support() public view returns (string memory, string memory, string memory) {
        return (uint2str(villainLevel), uint2str(villainStrength), uint2str(villainSupport)); 
    }

    //////////////////////////
    ///@dev OnlyOwner functions   
    //////////////////////////

    /// @dev owner withdraw 
    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        payable(msg.sender).transfer(balance);
    }     
    
    ///@dev owner sets fee for 'buyLevel' functions
    function setLevelUpFee(uint _fee) public onlyOwner {
        levelUpFee = _fee;
    }   

    //////////////////////////
    ///@dev Math functions   
    //////////////////////////
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }
    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
            if (_i == 0) {
                return "0";
            }
            uint j = _i;
            uint len;
            while (j != 0) {
                len++;
                j /= 10;
            }
            bytes memory bstr = new bytes(len);
            uint k = len;
            while (_i != 0) {
                k = k-1;
                uint8 temp = (48 + uint8(_i - _i / 10 * 10));
                bytes1 b1 = bytes1(temp);
                bstr[k] = b1;
                _i /= 10;
            }
            return string(bstr);
    }
}