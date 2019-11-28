require 'rails_helper'

RSpec.describe Cancha, type: :model do
  let!(:usuario) {
    Usuario.create!(
      username: "test",
      email: "test@here.com",
      password_digest: "password123",
      nombre: "tester",
      apellido: "Testing"
    )
  }
  describe "Validations" do
    it "crea una cancha valida sin descripcion" do
      cancha = Cancha.new(
        creador: usuario,
        precio_hora: 12.0,
        costo_extra1: 5,
        nombre: "Cancha1"
      )
      expect(cancha).to be_valid
    end

    it "crea una cancha con descipcion valida" do
      cancha = Cancha.new(
        creador: usuario,
        precio_hora: 12.0,
        costo_extra1: 5,
        nombre: "Cancha1",
        descripcion: "Dolorem ipsum quia dolor sit amet"
      )
      expect(cancha).to be_valid
    end

    it "no valida sin nombre" do
      cancha = Cancha.new(
        creador: usuario,
        precio_hora: 12.0,
        costo_extra1: 5,
        nombre: nil,
        descripcion: "Dolorem ipsum quia dolor sit amet"
      )
      expect(cancha).to be_invalid
    end

    it "no valida sin precio" do
      cancha = Cancha.new(
        creador: usuario,
        precio_hora: 0,
        costo_extra1: 5,
        nombre: "canchita",
        descripcion: "Dolorem ipsum quia dolor sit amet"
      )
      expect(cancha).to be_invalid
    end
  end

  describe "Calculador de precios" do
    let!(:cancha) {
      Cancha.create(
        creador: usuario,
        precio_hora: 7,
        costo_extra1: 3,
        condicion_extra1: {tipo: "hora", hora_inicio: "22:00", hora_fin: "5:00"},
        nombre: "canchita",
        descripcion: "Dolorem ipsum quia dolor sit amet"
      )
    }
    it "obtiene precio fuera de condiciones" do
      hora_inicio = Time.new(2019,07,27,10,10,0)
      hora_fin = Time.new(2019,07,27,12,10,0)
      precio = cancha.precio_con_condiciones(hora_inicio, hora_fin)
      expect(precio).to eq(14.0)
    end

    it "obtiene precio dentro de las condiciones" do
      hora_inicio = Time.new(2019,07,27,22,10,0)
      hora_fin = Time.new(2019,07,27,23,40,0)
      precio = cancha.precio_con_condiciones(hora_inicio, hora_fin)
      expect(precio).to eq(15)
    end
  end
end
