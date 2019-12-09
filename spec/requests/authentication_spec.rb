require "rails_helper"

RSpec.describe "Autenticación", type: :request do
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
  end

  describe "Autentificacion de usuario y clave" do
    it "Autentifica adecuadamente" do
      expect(api_login(username: "tester123", password: "password")).to include("Authorization")
    end
    it "No autoriza login" do
      api_login(username: "tester123", password: "passwordito")
      expect(response).to have_http_status(401)
    end
  end
end
