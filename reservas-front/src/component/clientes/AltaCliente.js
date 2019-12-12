import React, { Component } from 'react';
import axios from "axios";

class AltaCliente extends Component {
  constructor(props) {
    super(props)
    this.state = {
      email: "",
      nombre: "",
      apellido: "",
      telefono: "",
      direccion: "",
      fecha_nacimiento: "",
      registration_errors: ""
    }
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit(event) {
    axios.post(
      "http://localhost:3001/clientes",
      {
        cliente: {
          email: this.state.email,
          nombre: this.state.nombre,
          apellido: this.state.apellido,
          telefono: this.state.telefono,
          direccion: this.state.direccion,
          fecha_nacimiento: this.state.fecha_nacimiento,
        }
      },
      { withCredentials: true }
    ).then(response => {
      console.log("cliente", response);
    }).catch(error => {
      console.log("error", error);
    });
    event.preventDefault();
  }

  handleChange(event) {
    this.setState({
      [event.target.name]: event.target.value
    });
  }

  render() { 
    return ( 
      <div>
        <h3>Alta de cliente</h3>
        <form onSubmit={this.handleSubmit}>
          <input type="text" name="nombre" placeholder="Nombre" value={this.state.nombre} onChange={this.handleChange} required />
          <input type="text" name="apellido" placeholder="Apellido" value={this.state.apellido} onChange={this.handleChange} required />
          <input type="email" name="email" placeholder="e-mail" value={this.state.email} onChange={this.handleChange} />
          <input type="text" name="telefono" placeholder="Telefono" value={this.state.telefono} onChange={this.handleChange} required />
          <input type="text" name="direccion" placeholder="Direccion" value={this.state.direccion} onChange={this.handleChange} />
          <input type="text" name="fecha_nacimiento" placeholder="Fecha de Nacimiento" value={this.state.nombre} onChange={this.handleChange} />
          <button type="submit">Registrar</button>
        </form>
      </div>
     );
  }
}
 
export default AltaCliente;