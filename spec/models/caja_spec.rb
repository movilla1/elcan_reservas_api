require "rails_helper"

RSpec.describe Caja, type: :model do
  let!(:usuario) {
    Usuario.create!(
      username: "test",
      email: "test@here.com",
      password_digest: "password123",
      nombre: "tester",
      apellido: "Testing"
    )
  }
  describe "#Validations" do
    it "no crea caja sin fondo" do
      caja = Caja.new(fecha: Date.today, creador: usuario)
      expect(caja).to be_invalid
    end
    it "no crea caja sin fecha" do
      caja = Caja.new(fondo_inicial: 1000, creador: usuario)
      expect(caja).to be_invalid
    end
  end
end
