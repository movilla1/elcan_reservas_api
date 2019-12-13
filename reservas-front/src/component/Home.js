import React, { Component } from 'react';
import Login from './auth/Login';

class Home extends Component {
  constructor(props) {
    super(props);
    this.handleSuccessfulAuth = this.handleSuccessfulAuth.bind(this);
  }

  handleSuccessfulAuth(data) {
    this.props.handleLogin(data);
    this.props.history.push("/dashboard");
  }

  render() {
    var loginIfNeeded="";
    if (!this.props.loggedInStatus) {
      loginIfNeeded = <Login handleSuccessfulAuth={this.handleSuccessfulAuth} />
    } else {
      this.props.history.push("/dashboard");
    }
    return ( 
      <div>
        <h1>Elcan Reservas</h1>
        {loginIfNeeded}
      </div>
     );
  }
}
 
export default Home;