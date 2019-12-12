import React, { Component } from 'react';
import Avatar from '@material-ui/core/Avatar';
import Button from '@material-ui/core/Button';
import CssBaseline from '@material-ui/core/CssBaseline';
import TextField from '@material-ui/core/TextField';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import Checkbox from '@material-ui/core/Checkbox';
import Link from '@material-ui/core/Link';
import Grid from '@material-ui/core/Grid';
import Box from '@material-ui/core/Box';
import LockOutlinedIcon from '@material-ui/icons/LockOutlined';
import Typography from '@material-ui/core/Typography';
import { makeStyles } from '@material-ui/core/styles';
import Container from '@material-ui/core/Container';
import axios from "axios";

class LoginOld extends Component {
  constructor(props) {
    super(props)
    this.state = {
      AuthToken: "",
      isLoggedIn: false,
      message: "",
      password: "",
      usuario: ""
    }
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit(event) {
    axios.post( "http://localhost:3001/login", {
      username: this.state.usuario,
      password: this.state.password
    }).then(response => {
      if (response.data.auth_token) {
        this.setState({
          AuthToken: response.data.auth_token,
          isLoggedIn: true
        });
        this.props.handleSuccessfulAuth(response.data.auth_token);
      }
    }).catch( error => {
      this.setState({
        message: "Fallo al ingresar, verifique los datos",
        isLoggedIn: false
      });
      // console.log(error); only debug
    });
    event.preventDefault();
  }

  handleChange(event) {
    this.setState({
      [event.target.name]: event.target.value
    });
  }

  render() {
    var status_msg = "";
    if (this.state.message.length > 0) {
      status_msg = <div>{this.state.message}</div>;
    }
    var form_tag = ""
    if (this.state.isLoggedIn === false) {
      form_tag = <form onSubmit={this.handleSubmit}>
        <input
          type="text"
          name="usuario"
          placeholder="Usuario"
          value={this.state.usuario}
          onChange={this.handleChange}
          required />
        <input
          type="text"
          name="password"
          placeholder="Contraseña"
          value={this.state.password}
          onChange={this.handleChange}
          required />
        <Button type="submit" variant="contained" color="primary">Login</Button>
      </form>
    }

    return (
      <div className="login_form">
        {form_tag}
        {status_msg}
      </div>
     );
  }
}
 
export default LoginOld;