require 'rails_helper'

RSpec.describe VendibleVenta, type: :model do
  describe "validations" do
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
    let!(:venta) {
      Venta.create!(
        caja: caja,
        creador: usuario,
        status: :abierta,
        nota: "Test de venta para comprobar funcionamiento",
        total: 0
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
    it "no valida cantidad negativa" do
      vv = VendibleVenta.new(
        cantidad: -1,
        creador: usuario,
        venta: venta,
        vendible: articulo1,
        subtotal: 10.4
      )
      expect(vv).to be_invalid
      expect(vv.errors.messages).to include(cantidad: ["debe ser mayor que 0"])
    end

    it "no valida sin cantidad" do
      vv = VendibleVenta.new(
        cantidad: nil,
        creador: usuario,
        venta: venta,
        vendible: articulo1,
        subtotal: 10.4
      )
      expect(vv).to be_invalid
      expect(vv.errors.messages).to include(cantidad: ["no puede estar en blanco", "no es un número"])
    end

    it "no valida subtotal negativo" do
      vv = VendibleVenta.new(
        cantidad: 2,
        creador: usuario,
        venta: venta,
        vendible: articulo1,
        subtotal: -1.0
      )
      expect(vv).to be_invalid
      expect(vv.errors.messages).to include(subtotal: ["debe ser mayor que 0"])
    end

    it "crea registro adecuadamente" do
      vv = VendibleVenta.new(
        cantidad: 2,
        creador: usuario,
        venta: venta,
        vendible: articulo1,
        subtotal: 10.4
      )
      expect(vv).to be_valid
      expect(vv.errors.messages.count).to eq(0)
    end
  end
end
