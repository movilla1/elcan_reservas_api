require 'rails_helper'

RSpec.describe Articulo, type: :model do
  let!(:usuario) {
    Usuario.create!(
      username: "test",
      email: "test@here.com",
      password_digest: "password123",
      nombre: "tester",
      apellido: "Testing"
    )
  }
  let!(:proveedor) {
    Proveedor.create!(
      creador: usuario,
      nombre: "testprov",
      direccion: "av 123",
      telefono: "351-3321",
      email: "prov@test.com",
      contacto: "Raulito",
      sitio_web: "www.test.com"
    )
  }
  describe "# Validations" do
    #validates :precio_compra, presence: true, numericality: { greater_than: 0 }
    it "no valida sin precio de compra" do
      art = Articulo.new(creador: usuario, nombre: "sarasa", codigo: "123123", cantidad: 2)
      expect(art).to be_invalid
      expect(art.errors).to include("precio_compra")
    end

    it "no valida sin precio de venta ni margen" do
      art = Articulo.new(
        creador: usuario,
        nombre: "sarasa",
        codigo: "123123",
        cantidad: 2,
        precio_compra: 1.21
      )
      expect(art).to be_invalid
      expect(art.errors).to include("precio_venta")
      expect(art.errors).to include("margen")
    end

    it "no valida nombre ausente" do
      art = Articulo.new(
        creador: usuario,
        nombre: nil,
        codigo: "123123",
        cantidad: 2,
        precio_compra: 1.21,
        precio_venta: 2.42,
        margen: 100
      )
      expect(art).to be_invalid
      expect(art.errors.messages).to include(nombre: ["is too short (minimum is 3 characters)"])
    end

    it "no valida articulo sin codigo" do
      art = Articulo.new(
        creador: usuario,
        nombre: "sarasasa",
        codigo: nil,
        cantidad: 2,
        precio_compra: 1.21,
        precio_venta: 2.42,
        margen: 100
      )
      expect(art).to be_invalid
      expect(art.errors.messages).to include(codigo: ["is too short (minimum is 3 characters)"])
    end
  end

  describe "# Auto Precios" do
    it "autocalcula margen" do
      art = Articulo.new(
        creador: usuario,
        nombre: "sarasasa",
        codigo: "123123",
        cantidad: 2,
        precio_compra: 1.21,
        precio_venta: 2.42,
        margen: nil
      )
      expect(art).to be_valid
      expect(art.margen).to eq(200)
    end

    it "autocalcula precio_venta" do
      art = Articulo.new(
        creador: usuario,
        nombre: "sarasasa",
        codigo: "123123",
        cantidad: 2,
        precio_compra: 1.21,
        precio_venta: nil,
        margen: 200
      )
      expect(art).to be_valid
      expect(art.precio_venta).to eq(2.42)
    end
  end
end
