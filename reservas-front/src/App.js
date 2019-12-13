import React, { Component } from 'react';
import './App.css';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import Dashboard from './component/Dashboard';
import Home from './component/Home';
import AltaCliente from "./component/clientes/AltaCliente";
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Cookies from 'universal-cookie';

class App extends Component {
  constructor() {
    super();

    this.state = {
      loggedInStatus: false,
      AuthToken: ""
    };
    this.handleLogin = this.handleLogin.bind(this);
    this.handleLogout = this.handleLogout.bind(this);

    const cookies = new Cookies();
    var cookie_data = cookies.get("details");
    if (typeof(cookie_data) !== 'undefined') {
      // cookie is set, autologin if all is ok
      console.log("Cookie set")
      if (typeof(cookie_data.token) !== 'undefined') {
        this.state = {loggedInStatus: true, AuthToken: cookie_data.token, role: cookie_data.role}
        console.log("Loged in");
      }
    }
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
                <Dashboard {...props} loggedInStatus={this.state.loggedInStatus} selectedMenu="/" headTitle="Tablero General">
                  <Grid item xs={12}>
                    <Paper className="dashboard-main">
                      <h3>Bienvenido al Tablero de control</h3>
                    </Paper>
                  </Grid>
                </Dashboard>
              )} />
            <Route
              exact
              path={"/clientes/alta"}
              render = { props => (
                <Dashboard {...props} loggedInStatus={this.state.loggedInStatus} selectedMenu={"clientes/alta"} headTitle="Alta de Cliente">
                  <AltaCliente {...props} authToken={this.state.AuthToken} />
                </Dashboard>
              )} />
          </Switch>
        </BrowserRouter>
      </div>
    );
  }
}

export default App;
