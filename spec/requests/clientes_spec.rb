require 'rails_helper'

RSpec.describe "Clientes", type: :request do
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

  describe "GET /clientes" do
    before do
      @clientes = []
      [0, 1, 2, 3].each do
        @clientes.push FactoryBot.create(:cliente, creador: @usr)
      end
    end

    it "Obtiene la lista de clientes" do
      get clientes_path, headers: @headers
      expect(response).to have_http_status(200)
      expect(response.body).to include(@clientes[1].nombre)
    end

    it "obtiene un cliente especifica" do
      get "/clientes/#{@clientes[0].id}.json", headers: @headers
      expect(response).to have_http_status(200)
      expect(response.body).to include(@clientes[0].nombre)
    end

    it "No descarga cliente inválida" do
      get "/clientes/2312123.json", headers: @headers
      expect(response).to have_http_status(404)
    end
  end

  describe "POST /clientes" do
    it "Crea un cliente" do
      expect {
        post "/clientes",
          params: {
            cliente: {
              nombre: "Lorem ipsum 123",
              apellido: "Lorem ipsum sir dolor amet",
              direccion: "Acasito 123",
              telefono: "422-2211",
              email: "tester@here.com",
              creador_id: @usr.id
            }
          },
          headers: @headers
        }.to change(Cliente, :count).by(1)
      expect(response).to have_http_status(201)
    end

    it "No puede crear cliente invalida" do
      post "/clientes",
        params: {
          cliente: {
            nombre: nil,
            apellido: "Lorem ipsum sir dolor amet",
            direccion: "Acasito 123",
            telefono: "422-2211",
            email: "tester@here.com",
            creador_id: @usr.id
          }
        },
        headers: @headers

      expect(response).to have_http_status(422)
    end
  end

  describe "PATCH /cliente/x.json" do
    before do
      @clientes = []
      [0, 1, 2, 3].each do
        @clientes.push FactoryBot.create(:cliente, creador: @usr)
      end
    end
    it "Actualiza adecuadamente un cliente" do
      expect {
        patch "/clientes/#{@clientes[1].id}.json",
          params: {
            cliente: {
              nombre: "Testing 123",
              apellido: "Teseracto"
            }
          },
          headers: @headers
      }.not_to change(Cliente, :count)
      expect(response).to have_http_status(200)
    end

    it "Falla al actualizar un cliente" do
      patch "/clientes/#{@clientes[1].id}.json",
        params: {
          cliente: {
            nombre: nil
          }
        },
        headers: @headers
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE /clientes/1.json" do
    before do
      @clientes = []
      [0, 1, 2, 3].each do
        @clientes.push FactoryBot.create(:cliente, creador: @usr)
      end
    end

    it "Borra un cliente" do
      expect {
        delete "/clientes/#{@clientes[1].id}.json",
          params: {
            cliente: {
              precio_hora: 123.99,
              nombre: "Testing 123"
            }
          },
          headers: @headers
      }.to change(Cliente, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end
