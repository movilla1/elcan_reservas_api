# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Canchas", type: :request do
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

  describe "GET /canchas" do
    before do
      @canchas = []
      [0, 1, 2, 3].each do
        @canchas.push FactoryBot.create(:cancha, creador: @usr)
      end
    end

    it "Obtiene la lista de canchas" do
      get canchas_path, headers: @headers
      expect(response).to have_http_status(200)
      expect(response.body).to include(@canchas[1].nombre)
    end

    it "obtiene una cancha especifica" do
      get "/canchas/#{@canchas[0].id}.json", headers: @headers
      expect(response).to have_http_status(200)
      expect(response.body).to include(@canchas[0].nombre)
    end

    it "No descarga cancha inválida" do
      get "/canchas/2312123.json", headers: @headers
      expect(response).to have_http_status(404)
    end
  end

  describe "POST /canchas" do
    it "Crea una cancha" do
      expect {
        post "/canchas",
          params: {
            cancha: {
              nombre: "Lorem ipsum 123",
              descripcion: "Lorem ipsum sir dolor amet",
              precio_hora: 12.31,
              creador_id: @usr.id
            }
          },
          headers: @headers
      }.to change(Cancha, :count).by(1)
      expect(response).to have_http_status(201)
    end

    it "No puede crear cancha invalida" do
      post "/canchas",
        params: {
          cancha: {
            nombre: "Lorem ipsum 123",
            descripcion: "Lorem ipsum sir dolor amet",
            precio_hora: nil,
            creador_id: @usr.id
          }
        },
        headers: @headers

      expect(response).to have_http_status(422)
    end
  end

  describe "PATCH /cancha/x.json" do
    before do
      @canchas = []
      [0, 1, 2, 3].each do
        @canchas.push FactoryBot.create(:cancha, creador: @usr)
      end
    end
    it "Actualiza adecuadamente una cancha" do
      expect {
        patch "/canchas/#{@canchas[1].id}.json",
          params: {
            cancha: {
              precio_hora: 123.99,
              nombre: "Testing 123"
            }
          },
          headers: @headers
      }.not_to change(Cancha, :count)
      expect(response).to have_http_status(200)
    end

    it "Falla al actualizar una cancha" do
      patch "/canchas/#{@canchas[1].id}.json",
        params: {
          cancha: {
            precio_hora: nil
          }
        },
        headers: @headers
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE /canchas/1.json" do
    before do
      @canchas = []
      [0, 1, 2, 3].each do
        @canchas.push FactoryBot.create(:cancha, creador: @usr)
      end
    end

    it "Borra una cancha" do
      expect {
        delete "/canchas/#{@canchas[1].id}.json",
          params: {
            cancha: {
              precio_hora: 123.99,
              nombre: "Testing 123"
            }
          },
          headers: @headers
      }.to change(Cancha, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end
