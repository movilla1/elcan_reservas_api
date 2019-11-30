require 'rails_helper'

RSpec.describe Compra, type: :model do
  let!(:usuario) {
    Usuario.create!(
      username: "test",
      email: "test@here.com",
      password_digest: "password123",
      nombre: "tester",
      apellido: "Testing"
    )
  }
  let!(:caja) {
    Caja.create!(
      fecha: Time.zone.today,
      fondo_inicial: 1000,
      creador: usuario
    )
  }
  let!(:proveedor) {
    Proveedor.create!(
      creador: usuario,
      nombre: "tester prov",
      telefono: "312-1234",
      email: "testing@test.com",
      direccion: "test 123",
      contacto: "hola123"
    )
  }
  describe "Validations" do
    it "Crea un registro válido" do
      compra = Compra.new(
        caja: caja,
        creador: usuario,
        proveedor: proveedor,
        status: :abierta
      )
      expect(compra).to be_valid
    end

    it "no valida status vacio" do
      compra = Compra.new(
        caja: caja,
        creador: usuario,
        proveedor: proveedor,
        status: nil
      )
      expect(compra).to be_invalid
    end
  end

  describe "Procesa compra" do
    let!(:articulo1){
      Articulo.create!(
        proveedores: [ proveedor ],
        creador: usuario,
        nombre: "test item",
        codigo: "123123123",
        precio_compra: 10.1,
        precio_venta: 20.2,
        descuento: 0,
        tipo_descuento: "porcentual",
        cantidad: 2
      )
    }
    let!(:articulo2){
      Articulo.create!(
        proveedores: [ proveedor ],
        creador: usuario,
        nombre: "test item2",
        codigo: "123123124",
        precio_compra: 10.2,
        precio_venta: 20.4,
        descuento: 0,
        tipo_descuento: "porcentual",
        cantidad: 3
      )
    }
    it "procesa la compra y actualiza el stock y precios" do
      cpr = Compra.create!(
        caja: caja,
        proveedor: proveedor,
        creador: usuario,
        status: :abierta
      )
      ArticuloCompra.create!(
        articulo: articulo1,
        precio_anterior: 10.2,
        precio_actual: 10.4,
        cantidad: 2,
        origen_compra: cpr,
        status: :abierto,
        creador: usuario
      )
      err = cpr.procesar_compra
      expect(err).to eq([])
      expect { articulo1.reload }.to change(articulo1, :cantidad).by(2)
      expect(articulo1.precio_compra).to eq(10.4)
    end
  end
end
