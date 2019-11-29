require 'rails_helper'

RSpec.describe Cliente, type: :model do
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
      cliente = Cliente.new(
        apellido: "tester",
        creador: usuario,
        email: "test@here.com",
        telefono: "351-3332222"
      )
      expect(cliente).to be_invalid
    end

    it "no valida sin apellido" do
      cliente = Cliente.new(
        nombre: "testingo",
        apellido: nil,
        creador: usuario,
        email: "test@here.com",
        telefono: "351-3332222"
      )
      expect(cliente).to be_invalid
    end

    it "no valida sin telefono" do
      cliente = Cliente.new(
        nombre: "testingo",
        apellido: "tester",
        creador: usuario,
        email: "test@here.com",
        telefono: nil
      )
      expect(cliente).to be_invalid
    end

    it "no valida telefono mal formado" do
      cliente = Cliente.new(
        nombre: "testingo",
        apellido: "tester",
        creador: usuario,
        email: "test@here.com",
        telefono: "351-3332222#"
      )
      expect(cliente).to be_invalid
    end

    it "no valida emails malformados" do
      cliente = Cliente.new(
        nombre: "testingo",
        creador: usuario,
        apellido: "tester",
        email: "test@here@com",
        telefono: "351-3332222"
      )
      expect(cliente).to be_invalid
    end

    it "crea cliente" do
      cliente = Cliente.new(
        nombre: "testingo",
        creador: usuario,
        apellido: "tester",
        email: "test@here.com",
        telefono: "351-3332222"
      )
      expect(cliente).to be_valid
    end
  end
end
