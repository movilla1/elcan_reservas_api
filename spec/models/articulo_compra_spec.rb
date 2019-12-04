require 'rails_helper'

RSpec.describe ArticuloCompra, type: :model do
  describe "Validations" do
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
    let!(:compra) {
      Compra.create!(
        caja: caja,
        proveedor: proveedor,
        creador: usuario,
        status: :abierta
      )
    }
    it "no valida precio_anterior negativo" do
      art = ArticuloCompra.new(
        articulo: articulo1,
        precio_anterior: -10.2,
        precio_actual: 10.4,
        cantidad: 2,
        origen_compra: compra,
        status: :abierta,
        creador: usuario
      )
      expect(art).to be_invalid
      expect(art.errors.messages).to include(precio_anterior: ["debe ser mayor que 0"])
    end

    it "no valida precio_actual negativo" do
      art = ArticuloCompra.new(
        articulo: articulo1,
        precio_anterior: 10.2,
        precio_actual: -10.4,
        cantidad: 2,
        origen_compra: compra,
        status: :abierta,
        creador: usuario
      )
      expect(art).to be_invalid
      expect(art.errors.messages).to include(precio_actual: ["debe ser mayor que 0"])
    end

    it "no valida sin cantidad" do
      art = ArticuloCompra.new(
        articulo: articulo1,
        precio_anterior: 10.2,
        precio_actual: 10.4,
        cantidad: nil,
        origen_compra: compra,
        status: :abierta,
        creador: usuario
      )
      expect(art).to be_invalid
      expect(art.errors.messages).to include(cantidad: ["no es un número", "no puede estar en blanco"])
    end

    it "no valida cantidad negativa" do
      art = ArticuloCompra.new(
        articulo: articulo1,
        precio_anterior: 10.2,
        precio_actual: 10.4,
        cantidad: -2,
        origen_compra: compra,
        status: :abierta,
        creador: usuario
      )
      expect(art).to be_invalid
      expect(art.errors.messages).to include(cantidad: ["debe ser mayor que 0"])
    end

    it "crea registro válido" do
      art = ArticuloCompra.new(
        articulo: articulo1,
        precio_anterior: 10.2,
        precio_actual: 10.4,
        cantidad: 2,
        origen_compra: compra,
        status: :abierta,
        creador: usuario
      )
      expect(art).to be_valid
    end
  end
end
