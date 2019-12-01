require 'rails_helper'

RSpec.describe Venta, type: :model do
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

  describe "Validations" do
    it "no valida total negativo" do
      venta = Venta.new(
        caja: caja,
        creador: usuario,
        status: :abierta,
        total: -12,
        nota: "Lorem ipsum sir dolor amet"
      )
      expect(venta).to be_invalid
      expect(venta.errors.messages).to include(total: ["debe ser mayor que o igual a 0"])
    end

    it "no valida nota demasiado corta" do
      venta = Venta.new(
        caja: caja,
        creador: usuario,
        nota: "a",
        status: :abierta,
        total: 12
      )
      expect(venta).to be_invalid
      expect(venta.errors.messages).to include(nota: ["es demasiado corto (3 caracteres mínimo)"])
    end

    it "no valida sin estado" do
      venta = Venta.new(
        caja: caja,
        creador: usuario,
        status: nil,
        total: 12,
        nota: "Lorem ipsum sir dolor amet"
      )
      expect(venta).to be_invalid
      expect(venta.errors.messages).to include(status: ["no puede estar en blanco"])
    end
  end

  describe "funciones" do
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
  end
end
