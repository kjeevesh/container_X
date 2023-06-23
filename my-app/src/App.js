import React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Tables from './components/tablecomponents';
import BasicExample from './components/homepage';
import homepage from './components/homepage';

const App = () => {
  return (
    <Router>
      <Route exact path="/" component={homepage} />
      <Route exact path="/scheduler" component={Tables} />
      <Route path="/home" component={BasicExample} />
      
    </Router>
  );
};

export default App;