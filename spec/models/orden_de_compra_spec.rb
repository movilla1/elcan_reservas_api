require 'rails_helper'

RSpec.describe OrdenDeCompra, type: :model do
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
    it "no valida notas muy cortas" do
      oc = OrdenDeCompra.new(
        nota: "hola",
        creador: usuario,
        status: :abierta
      )
      expect(oc).to be_invalid
      expect(oc.errors.messages).to include(nota: ["es demasiado corto (5 caracteres mínimo)"])
    end

    it "crea registro bien" do
      oc = OrdenDeCompra.new(
        nota: "Lorem ipsum sir dolor amet quisci",
        creador: usuario,
        status: :abierta
      )
      expect(oc).to be_valid
    end
  end
end
