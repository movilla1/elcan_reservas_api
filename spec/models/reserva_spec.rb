require 'rails_helper'

RSpec.describe Reserva, type: :model do
  let!(:usuario) {
    Usuario.create!(
      username: "test",
      email: "test@here.com",
      password_digest: "password123",
      nombre: "tester",
      apellido: "Testing"
    )
  }
  let!(:cliente) {
    Cliente.create!(
      nombre: "Pepe",
      apellido: "Tester",
      telefono: "312-1234",
      email: "here@test.com",
      creador: usuario
    )
  }
  let!(:cancha) {
    Cancha.create!(
      nombre: "Cancha1",
      creador: usuario,
      descripcion: "Cancha de prueba",
      precio_hora: 5.0
    )
  }
  describe "Validations" do
    it "No valida adelanto negativo" do
      res = Reserva.new(
        creador: usuario,
        cliente: cliente,
        cancha: cancha,
        adelanto: -2,
        fecha_inicio: Time.zone.today + 1.day,
        fecha_fin: Time.zone.today + 1.day + 1.hour
      )
      expect(res).to be_invalid
    end

    it "No valida reservas en el pasado" do
      res = Reserva.new(
        creador: usuario,
        cliente: cliente,
        cancha: cancha,
        adelanto: 20,
        fecha_inicio: Time.zone.today - 1.day,
        fecha_fin: Time.zone.today - 1.day + 1.hour
      )
      expect(res).to be_invalid
    end

    it "No valida sin cancha" do
      res = Reserva.new(
        creador: usuario,
        cliente: cliente,
        adelanto: 20,
        fecha_inicio: Time.zone.today,
        fecha_fin: Time.zone.today + 1.hour
      )
      expect(res).to be_invalid
    end

    it "crea registro válido" do
      res = Reserva.new(
        creador: usuario,
        cliente: cliente,
        cancha: cancha,
        adelanto: 20,
        fecha_inicio: Time.zone.today + 1.day,
        fecha_fin: Time.zone.today + 1.day + 1.hour
      )
      expect(res).to be_valid
    end
  end

  describe "Administracion" do
    it "crea venta y vendible al crear una reserva" do
      res = Reserva.new(
        creador: usuario,
        cliente: cliente,
        cancha: cancha,
        adelanto: 20.0,
        fecha_inicio: Time.zone.today + 1.day,
        fecha_fin: Time.zone.today + 1.day + 1.hour
      )
      caja = Caja.create!(fecha: Time.zone.today, fondo_inicial: 100.0, creador: usuario)
      expect { res.save }.to change(Reserva, :count).by(1)
      expect{ res.crear_venta(caja) }.to change(Venta, :count).by(1)
      expect(VendibleVenta.count).to be(1)
      expect(VendibleVenta.first.subtotal).to eq(res.adelanto)
    end

    it "Calcula valor total de la reserva" do
      res = Reserva.new(
        creador: usuario,
        cliente: cliente,
        cancha: cancha,
        adelanto: 2.0,
        fecha_inicio: Time.zone.today + 1.day,
        fecha_fin: Time.zone.today + 1.day + 1.hour
      )
      expect(res.calcular_total).to eq([5, 3])
    end
  end
end
