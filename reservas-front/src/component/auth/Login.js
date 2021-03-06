import React, { useState } from 'react';
import axios from 'axios';
import Cookies from 'universal-cookie';
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

function Copyright() {
  return (
    <Typography variant="body2" color="textSecondary" align="center">
      {'Copyright © '}
      <Link color="inherit" href="http://www.elcansoftware.com/">
        ElcanSoftware
      </Link>{' '}
      {new Date().getFullYear()}
      {'.'}
    </Typography>
  );
}

const useStyles = makeStyles(theme => ({
  paper: {
    marginTop: theme.spacing(8),
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
  },
  avatar: {
    margin: theme.spacing(1),
    backgroundColor: theme.palette.secondary.main,
  },
  form: {
    width: '100%', // Fix IE 11 issue.
    marginTop: theme.spacing(1),
  },
  submit: {
    margin: theme.spacing(3, 0, 2),
  },
}));

export default function Login(props) {
  const [authData, setAuthData] = useState({username: "", password: ""});
  // eslint-disable-next-line
  const [loginStatus, setLoginStatus] = useState({AuthToken: "", isLoggedIn: false, mensaje: ""});
  const classes = useStyles();

  const handleChange = (event) => {
    var new_data = authData;
    authData[event.target.name] = event.target.value;
    setAuthData(new_data);
  };

  const handleSubmit = (event) => {
    axios.post( "http://localhost:3001/login", {
      username: authData.username,
      password: authData.password
    }).then(response => {
      if (response.data.auth_token) {
        setLoginStatus({
          AuthToken: response.data.auth_token,
          role: response.data.role,
          isLoggedIn: true
        });
        props.handleSuccessfulAuth(response.data.auth_token);
        const cookies = new Cookies();
        cookies.set("details", {token: response.data.auth_token, role: response.data.role}, {path: "/"});
      }
    }).catch( error => {
      console.log(error);
      setLoginStatus({
        message: "Fallo al ingresar, verifique los datos",
        isLoggedIn: false
      });
    });
    event.preventDefault();
  }

  return (
    <Container component="main" maxWidth="xs">
      <CssBaseline />
      <div className={classes.paper}>
        <Avatar className={classes.avatar}>
          <LockOutlinedIcon />
        </Avatar>
        <Typography component="h1" variant="h5">
          Ingresar
        </Typography>
        <form className={classes.form} noValidate>
          <TextField
            variant="outlined"
            margin="normal"
            required
            fullWidth
            id="usuario"
            label="Usuario"
            name="username"
            autoComplete="usuario"
            autoFocus
            onChange={handleChange}
          />
          <TextField
            variant="outlined"
            margin="normal"
            required
            fullWidth
            name="password"
            label="Password"
            type="password"
            id="password"
            autoComplete="current-password"
            onChange={handleChange}
          />
          <FormControlLabel
            control={<Checkbox value="remember" color="primary" />}
            label="Mantener sesión"
          />
          <Button
            type="submit"
            fullWidth
            variant="contained"
            color="primary"
            className={classes.submit}
            onClick={handleSubmit}
          >
            Log In
          </Button>
          <Grid container>
            <Grid item xs>
              <Link href="#" variant="body2">
                Olvidó su contraseña?
              </Link>
            </Grid>
          </Grid>
        </form>
      </div>
      <Box mt={8}>
        <Copyright />
      </Box>
    </Container>
  );
}