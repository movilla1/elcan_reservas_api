import React, { Component } from 'react';
import Registration from './auth/Registration';

class Home extends Component {
  state = {  }
  render() { 
    return ( 
      <div>
        <h1>Home</h1>
        <Registration />
      </div>
     );
  }
}
 
export default Home;