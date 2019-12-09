require 'rails_helper'

RSpec.describe "Cajas", type: :request do
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
  describe "GET /cajas" do
    before do
      @cajas = []
      [0, 1, 2, 3].each do
        @cajas.push FactoryBot.create(:caja, creador: @usr)
      end
    end
    it "works! (now write some real specs)" do
      get cajas_path, params: {}, headers: @headers
      expect(response).to have_http_status(200)
      expect(response.body).to include(@cajas[1].fondo_inicial.to_s)
    end

    it "gets caja id 1" do
      get "/cajas/1.json", params: {}, headers: @headers
      expect(response).to have_http_status(200)
      expect(response.body).to include("\"fondo_inicial\":#{@cajas[0].fondo_inicial}")
    end
  end

  describe "POST /cajas" do
    it "Crea una caja nueva" do
      post "/cajas",
        params: {
          caja: {
            fondo_inicial: 1233.12,
            fecha: Date.today,
            creador_id: @usr.id
          }
        },
        headers: @headers
      expect(response).to have_http_status(201)
      expect(response.body).to include("\"fondo_inicial\":1233.12")
      expect(Caja.count).to eq(1)
    end
    it "Falla al crear caja" do
      post "/cajas",
        params: {
          caja: {
            fondo_inicial: 1233.12,
            fecha: nil,
            creador_id: @usr.id
          }
        },
        headers: @headers
      expect(response).to have_http_status(422)
    end
  end

  describe "PATCH /caja/x.json" do
    before do
      @cajas = []
      [0, 1, 2, 3].each do
        @cajas.push FactoryBot.create(:caja, creador: @usr)
      end
    end
    it "Actualiza una caja" do
      patch "/cajas/#{@cajas[0].id}.json",
        params: {
          caja: {
            fondo_inicial: 1418.01
          }
        },
        headers: @headers
      expect(response).to have_http_status(200)
      @cajas[0].reload
      expect(@cajas[0].fondo_inicial).to eq(1418.01)
    end
    it "Actualiza una caja" do
      patch "/cajas/#{@cajas[0].id}.json",
        params: {
          caja: {
            fecha: nil
          }
        },
        headers: @headers
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE /cajas/x.json" do
    before do
      @cajas = []
      [0, 1, 2, 3].each do
        @cajas.push FactoryBot.create(:caja, creador: @usr)
      end
    end
    it "Borra una caja" do
      expect {
        delete "/cajas/#{@cajas[1].id}.json", params: {}, headers: @headers
      }.to change(Caja, :count).by(-1)
      expect(response).to have_http_status(204)
    end
    it "Falla al intentar borrar una caja que no existe" do 
      delete "/cajas/1230120.json", params: {}, headers: @headers
      expect(response).to have_http_status(404)
    end
  end
end
