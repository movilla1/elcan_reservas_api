import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import Dashboard from './component/Dashboard';
import NewDashboard from "./component/NewDashboard";
import Home from './component/Home';

class App extends Component {
  constructor() {
    super();

    this.state = {
      loggedInStatus: false,
      AuthToken: ""
    };

    this.handleLogin = this.handleLogin.bind(this);
    this.handleLogout = this.handleLogout.bind(this);
  }

  handleLogout() {
    this.setState({
      loggedInStatus: false,
      AuthToken: ""
    });
  }

  handleLogin(data) {
    this.setState({
      loggedInStatus: true,
      AuthToken: data
    });
  }

  render() {
    return (
      <div className="App">
        <BrowserRouter>
          <Switch>
            <Route
              exact
              path={"/"}
              render={ props => (
                <Home { ...props} loggedInStatus={this.state.loggedInStatus} handleLogin={this.handleLogin} />
              )}
              />
            <Route
              exact
              path={"/dashboard"}
              render = { props => (
                <Dashboard {...props} loggedInStatus={this.state.loggedInStatus} />
              )} />
              <Route
              exact
              path={"/new/dashboard"}
              render = { props => (
                <NewDashboard {...props} loggedInStatus={this.state.loggedInStatus} />
              )} />
          </Switch>
        </BrowserRouter>
      </div>
    );
  }
}

export default App;
