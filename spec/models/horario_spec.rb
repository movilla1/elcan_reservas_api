require 'rails_helper'

RSpec.describe Horario, type: :model do
  describe "Validations" do
    let!(:creador) {
      Usuario.create(
        username: "test",
        email: "test@here.com",
        password_digest: "password123",
        nombre: "tester",
        apellido: "Testing"
      )
    }

    it "no valida sin fecha" do
      horario = Horario.new(
        creador: creador,
        fecha: nil,
        hora_inicio: "10:00",
        hora_fin: "18:00"
      )
      expect(horario).to be_invalid
      expect(horario.errors.messages).to include({ fecha: ["no puede estar en blanco"] })
    end

    it "no valida sin hora_inicio" do
      horario = Horario.new(
        creador: creador,
        fecha: Time.zone.today,
        hora_inicio: nil,
        hora_fin: "18:00"
      )
      expect(horario).to be_invalid
      expect(horario.errors.messages).to include({ hora_inicio: ["no puede estar en blanco"] })
    end

    it "no valida sin hora_fin" do
      horario = Horario.new(
        creador: creador,
        fecha: Time.zone.today,
        hora_inicio: "10:00",
        hora_fin: nil
      )
      expect(horario).to be_invalid
      expect(horario.errors.messages).to include({ hora_fin: ["no puede estar en blanco"] })
    end

    it "crea registro valido" do
      horario = Horario.new(
        creador: creador,
        fecha: Time.zone.today,
        hora_inicio: "10:00",
        hora_fin: "18:00"
      )
      expect(horario).to be_valid
      expect(horario.errors.messages.count).to eq(0)
    end
  end
end
