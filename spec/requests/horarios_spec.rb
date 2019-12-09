# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Horarios", type: :request do
  before do
    @usr = Usuario.create!(
      username: "tester123",
      password_digest: "password",
      rol: :usuario,
      email: "tester@here.com",
      nombre: "testing user"
    )
    @usr.password = "password"
    @usr.save!
    @headers = api_login(username: "tester123", password: "password")
  end

  describe "GET /horarios" do
    it "solicitando lista de horarios" do
      horarios = []
      for a in 0..2 do
        horarios.push FactoryBot.create(:horario, creador: @usr)
      end
      get horarios_path,
        params: {},
        headers: @headers
      expect(response).to have_http_status(200)
      expect(response.body).to include("#{horarios[1].updated_at.strftime("%y-%m-%dT%H:%M:%S")}")
    end

    it "obtiene 1 horario solamente" do
      horarios = []
      for a in 0..2 do
        horarios.push FactoryBot.create(:horario, creador: @usr)
      end
      get horario_path(horarios[0]), params: {}, headers:  @headers
      expect(response).to have_http_status(200)
      expect(response.body).to include(horarios[0].nombre)
      expect(response.body).to include(horarios[0].hora_inicio)
    end
  end

  describe "POST /horarios" do
    it "crea un nuevo horario" do
      post horarios_path,
        params: {
          horario: {
            nombre: "Test Horario",
            hora_inicio: "10:01",
            hora_fin: "18:01",
            creador_id: @usr.id,
            fecha: Time.zone.today
          }
        },
        headers: @headers
      expect(response).to have_http_status(201)
      expect(response.body).to include("\"nombre\":\"Test Horario\"")
      horario = Horario.find_by(nombre: "Test Horario")
      expect(horario).to_not be_nil
    end

    it "Intenta crear un horario invalido" do
      post horarios_path,
        params: {
          horario: {
            nombre: "Test Horario",
            hora_inicio: "10:01",
            hora_fin: nil,
            creador_id: @usr.id,
            fecha: Time.zone.today
          }
        },
        headers: @headers
      expect(response).to have_http_status(422)
    end
  end

  describe "PATCH /horarios/1.json" do
    let!(:horario1){
      FactoryBot.create(:horario, creador: @usr)
    }
    it "updates horario1" do
      horario1.save!
      patch horario_path(horario1),
        params: {
          horario: {
            hora_inicio: "11:02",
            hora_fin: "17:01"
          }
        },
        headers: @headers
      horario1.reload
      expect(horario1.hora_inicio).to eq("11:02")
      expect(horario1.hora_fin).to eq("17:01")
      expect(response).to have_http_status(200)
      expect(response.body).to include("\"id\":1")
    end

    it "Intenta actualizar horario1 con datos invalidos" do
      horario1.save!
      patch horario_path(horario1),
        params: {
          horario: {
            hora_inicio: nil,
            hora_fin: "17:01"
          }
        },
        headers: @headers
      expect(response).to have_http_status(422)
    end

    it "intenta actualizar horario inexistente" do
      patch "/horarios/22.json",
        params: {
          horario: {
            hora_inicio: "11:02",
            hora_fin: "17:01"
          }
        },
        headers: @headers
      expect(response).to have_http_status(404)
      expect(response.body).to include("\"mensaje\":\"horario no encontrado\"")
    end
  end

  describe "DELETE /horarios/1.json" do
    let(:horario1) { FactoryBot.create(:horario, creador: @usr) }
    it "borra horario1" do
      horario1.save!
      expect {
        delete "/horarios/#{horario1.id}.json", params: {}, headers: @headers
      }.to change(Horario, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end
