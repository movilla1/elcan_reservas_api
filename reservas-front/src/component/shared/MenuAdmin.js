import React, { Component } from 'react';
import ListItem from '@material-ui/core/ListItem';
import List from '@material-ui/core/List';
import AddCircleIcon from '@material-ui/icons/AddCircle';
import ContactsIcon from '@material-ui/icons/Contacts';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import Collapse from '@material-ui/core/Collapse';
import EmojiPeopleIcon from '@material-ui/icons/EmojiPeople';
import SportsIcon from '@material-ui/icons/Sports';
import RoomServiceIcon from '@material-ui/icons/RoomService';
import EmojiTransportationIcon from '@material-ui/icons/EmojiTransportation';
import ExpandLess from '@material-ui/icons/ExpandLess';
import ExpandMore from '@material-ui/icons/ExpandMore';
import AccountTreeIcon from '@material-ui/icons/AccountTree';
import AddShoppingCartIcon from '@material-ui/icons/AddShoppingCart';
import WorkIcon from '@material-ui/icons/Work';
import HomeIcon from '@material-ui/icons/Home';
import { Link } from "react-router-dom";
import { makeStyles } from '@material-ui/core/styles';

class MenuAdmin extends Component {
  useStyles = makeStyles(theme => ({
    root: {
      width: '100%',
      maxWidth: 360,
      backgroundColor: theme.palette.background.paper,
    },
    nested: {
      paddingLeft: theme.spacing(4),
    },
  }));
  state = { canchas: true, reservas: false, clientes:false, proveedores: false, ventas: false };

  constructor(props) {
    super(props);
    //this.handleClick = this.handleClick.bind(this);
    this.classes = {}; //this.useStyles();
  }
  
  handleClick(target) {
    var new_status = this.state;
    new_status[target] = !this.state[target];
    this.setState(new_status);
  };

  render() { 
    return (
    <div>
      <List>
        <ListItem button component={Link} to="/dashboard">
          <ListItemIcon>
            <HomeIcon />
          </ListItemIcon>
          <ListItemText primary="Inicio" />
        </ListItem>
        <ListItem button onClick={() => this.handleClick("canchas")}>
          <ListItemIcon>
            <SportsIcon />
          </ListItemIcon>
          <ListItemText primary="Canchas" />
          {this.state.canchas ? <ExpandLess /> : <ExpandMore />}
        </ListItem>
        <Collapse in={this.state.canchas} timeout="auto" unmountOnExit>
          <List component="div" disablePadding>
            <ListItem button className={this.classes.nested}>
              <ListItemIcon>
                <AddCircleIcon />
              </ListItemIcon>
              <ListItemText primary="Alta" />
            </ListItem>
            <ListItem button  className={this.classes.nested}>
              <ListItemIcon>
                <ContactsIcon/>
              </ListItemIcon>
              <ListItemText primary="Listado" />
            </ListItem>
          </List>
        </Collapse>
        <ListItem button onClick={() => this.handleClick("reservas")}>
          <ListItemIcon>
            <RoomServiceIcon />
          </ListItemIcon>
          <ListItemText primary="Reservas" />
          {this.state.reservas ? <ExpandLess /> : <ExpandMore />}
        </ListItem>
        <Collapse in={this.state.reservas} timeout="auto" unmountOnExit>
          <List component="div" disablePadding>
            <ListItem button className={this.classes.nested}>
              <ListItemIcon>
                <AddCircleIcon />
              </ListItemIcon>
              <ListItemText primary="Alta" />
            </ListItem>
            <ListItem button  className={this.classes.nested}>
              <ListItemIcon>
                <ContactsIcon/>
              </ListItemIcon>
              <ListItemText primary="Listado" />
            </ListItem>
          </List>
        </Collapse>
        <ListItem button onClick={(e) => this.handleClick("clientes")}>
          <ListItemIcon>
            <EmojiPeopleIcon />
          </ListItemIcon>
          <ListItemText primary="Clientes" />
          {this.state.clientes ? <ExpandLess /> : <ExpandMore />}
        </ListItem>
        <Collapse in={this.state.clientes} timeout="auto" unmountOnExit>
          <List component="div" disablePadding>
            <ListItem button className={this.classes.nested} component={Link} to="/clientes/alta">
              <ListItemIcon>
                <AddCircleIcon />
              </ListItemIcon>
              <ListItemText primary="Alta" />
            </ListItem>
            <ListItem button  className={this.classes.nested}>
              <ListItemIcon>
                <ContactsIcon/>
              </ListItemIcon>
              <ListItemText primary="Listado" />
            </ListItem>
          </List>
        </Collapse>
        <ListItem button onClick={(e) => this.handleClick("ventas")}>
          <ListItemIcon>
            <WorkIcon />
          </ListItemIcon>
          <ListItemText primary="Ventas" />
          {this.state.ventas ? <ExpandLess /> : <ExpandMore />}
        </ListItem>
        <Collapse in={this.state.ventas} timeout="auto" unmountOnExit>
          <List component="div" disablePadding>
            <ListItem button className={this.classes.nested}>
              <ListItemIcon>
                <AddCircleIcon />
              </ListItemIcon>
              <ListItemText primary="Nueva Venta" />
            </ListItem>
            <ListItem button  className={this.classes.nested}>
              <ListItemIcon>
                <ContactsIcon/>
              </ListItemIcon>
              <ListItemText primary="Listado" />
            </ListItem>
          </List>
        </Collapse>
        <ListItem button onClick={(e) =>this.handleClick("proveedores")}>
          <ListItemIcon>
            <EmojiTransportationIcon />
          </ListItemIcon>
          <ListItemText primary="Proveedores" />
          {this.state.proveedores ? <ExpandLess /> : <ExpandMore />}
        </ListItem>
        <Collapse in={this.state.proveedores} timeout="auto" unmountOnExit>
          <List component="div" disablePadding>
            <ListItem button className={this.classes.nested}>
              <ListItemIcon>
                <AddCircleIcon />
              </ListItemIcon>
              <ListItemText primary="Alta" />
            </ListItem>
            <ListItem button  className={this.classes.nested}>
              <ListItemIcon>
                <ContactsIcon/>
              </ListItemIcon>
              <ListItemText primary="Listado" />
            </ListItem>
            <ListItem button  className={this.classes.nested}>
              <ListItemIcon>
                <AccountTreeIcon />
              </ListItemIcon>
              <ListItemText primary="Ordenes de Compra" />
            </ListItem>
            <ListItem button  className={this.classes.nested}>
              <ListItemIcon>
                <AddShoppingCartIcon />
              </ListItemIcon>
              <ListItemText primary="Compras" />
            </ListItem>
          </List>
        </Collapse>
      </List>
    </div>
    );
  }
}
 
export default MenuAdmin;
