require 'rails_helper'

RSpec.describe "Proveedores", type: :request do
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

  describe "GET /proveedores" do
    before do
      @proveedores = []
      [0, 1, 2].each do
        @proveedores.push FactoryBot.create(:proveedor, creador_id: @usr.id)
      end
    end
    it "carga el listado de proveedores" do
      get proveedores_path, headers: @headers
      expect(response).to have_http_status(200)
      expect(response.body).to include(@proveedores[0].nombre)
    end

    it "Carga un proveedor particular" do
      get "/proveedores/#{@proveedores[1].id}.json", headers: @headers
      expect(response).to have_http_status(200)
      expect(response.body).to include(@proveedores[1].nombre)
    end

    it "Intenta cargar un proveedor inexistente" do
      get "/proveedores/4526717.json", headers: @headers
      expect(response).to have_http_status(404)
    end
  end

  describe "POST /proveedores" do
    it "Crea un proveedor adecuadamente" do
      post "/proveedores",
        params: {
          proveedor: {
            nombre: "Testing 123",
            direccion: "Acasito 333",
            telefono: "351-3332222",
            contacto: "cuco loco",
            email: "test@here.com",
            sitio_web: "http://www.google.com?q=test+rails",
            creador_id: @usr.id
          }
        },
        headers: @headers
      expect(response).to have_http_status(201)
      expect(Proveedor.count).to eq(1)
    end

    it "Falla al crear proveedor" do
      post "/proveedores",
        params: {
          proveedor: {
            nombre: "Testing 123",
            direccion: "Acasito 333",
            telefono: nil,
            contacto: "cuco loco",
            email: "test@here.com",
            sitio_web: "http://www.google.com?q=test+rails",
            creador_id: @usr.id
          }
        },
        headers: @headers
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE /proveedores/1.json" do
    before do
      @proveedores = []
      [0, 1, 2].each do
        @proveedores.push FactoryBot.create(:proveedor, creador_id: @usr.id)
      end
    end
    it "Borra un proveedor adecuadamente" do
      expect {
        delete "/proveedores/#{@proveedores[0].id}.json", headers: @headers
      }.to change(Proveedor, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end

  describe "PATCH /proveedores" do
    before do
      @proveedores = []
      [0, 1, 2].each do
        @proveedores.push FactoryBot.create(:proveedor, creador_id: @usr.id)
      end
    end

    it "Actualiza un proveedor" do
      patch "/proveedores/#{@proveedores[0].id}.json",
        params:{
          proveedor: {
            nombre: "Pepe Funes"
          }
        },
        headers: @headers
      expect(response).to have_http_status(200)
      expect(Proveedor.find(@proveedores[0].id).nombre).to eq("Pepe Funes")
    end

    it "Falla al actualizar proveedor" do
      patch "/proveedores/#{@proveedores[0].id}.json",
        params:{
          proveedor: {
            nombre: nil
          }
        },
        headers: @headers
      expect(response).to have_http_status(422)
    end
  end
end
