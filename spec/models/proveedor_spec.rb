require 'rails_helper'

RSpec.describe Proveedor, type: :model do
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
    it "no valida sin nombre" do
      prov = Proveedor.new(
        creador: usuario,
        nombre: nil,
        telefono: "321-1233",
        email: "testing@test.com",
        direccion: "test 123"
      )
      expect(prov).to be_invalid
    end

    it "no valida sin telefono" do
      prov = Proveedor.new(
        creador: usuario,
        nombre: "tester prov",
        telefono: nil,
        email: "testing@test.com",
        direccion: "test 123",
        contacto: "hola123"
      )
      expect(prov).to be_invalid
    end

    it "no valida sin creador" do
      prov = Proveedor.new(
        nombre: "tester prov",
        telefono: "321-1234",
        email: "testing@test.com",
        direccion: "test 123",
        contacto: "hola123"
      )
      expect(prov).to be_invalid
    end

    it "crea registro válido" do
      prov = Proveedor.new(
        creador: usuario,
        nombre: "tester prov",
        telefono: "312-1234",
        email: "testing@test.com",
        direccion: "test 123",
        contacto: "hola123"
      )
      expect(prov).to be_valid
      expect{ prov.save }.to change(Proveedor, :count).by(1)
    end
  end
  
end
