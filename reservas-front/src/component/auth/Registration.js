import React, { Component } from 'react';

class Registration extends Component {
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
    console.log("Event sent");
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
        <h3>Registro de cliente</h3>
        <form onSubmit={this.handleSubmit}>
          <input type="text" name="nombre" placeholder="Nombre" value={this.state.nombre} onChange={this.handleChange} required />
          <input type="text" name="apellido" placeholder="Apellido" value={this.state.apellido} onChange={this.handleChange} required />
          <input type="email" name="email" placeholder="e-mail" value={this.state.email} onChange={this.handleChange} />
          <input type="text" name="telefono" placeholder="Telefono" value={this.state.telefono} onChange={this.handleChange} required />
          <input type="text" name="direccion" placeholder="Direccion" value={this.state.direccion} onChange={this.handleChange} />
          <input type="text" name="fecha_nacimiento" placeholder="Fecha de Nacimiento" value={this.state.nombre} onChange={this.handleChange} />
        </form>
      </div>
     );
  }
}
 
export default Registration;