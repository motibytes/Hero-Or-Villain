import logo from './logo.svg';
import Navbar from './Navbar';
import './App.css';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom'; 
import { useState } from 'react';
import Game from './Game'; 
import About from './About';
import HeaderHOV from './Header';
import Info from './info';
import Footer from './footer';
import Start from './start';
import Demo from './demo';


function App() {
  return (
    <Router>
      <div className="App"> 
      <HeaderHOV /> 

        <div className="content"> 

          <Switch> {/* returns first route that is returned as true, its almost like an if statement. if its in the route thats what happens */}
            
            <Route exact path="/"> 
              <Game /> {/* */}
            </Route>
            <Route path="/start"> 
              <Start /> {/* */}
            </Route>                        
            <Route path="/app"> 
              <Game /> {/* */}
            </Route>
            <Route path="/info"> 
              <Info /> {/* */}
            </Route>
            <Route path="/about"> 
              <About /> {/* */}
            </Route>            
            <Route path="/demo"> 
              <Demo /> {/* */}
            </Route>                      
          </Switch> 
        </div>  
      </div> 
      
      <br />
      <Navbar /> 
      <br />
      <Footer />
    </Router>
  );
}

export default App;
