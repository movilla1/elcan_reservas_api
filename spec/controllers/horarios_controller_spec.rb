require "rails_helper"

RSpec.describe HorariosController, type: :controller do
  let!(:user) do
    Usuario.create!(
      username: "tester1",
      password_digest: "password1",
      nombre: "Mario",
      email: "test@here.com",
      telefono:"+1555232233"
    )
  end
  let!(:user2) do
    Usuario.create!(
      username: "tester2",
      password_digest: "password2",
      nombre: "Franchu",
      email: "test2@hereandthere.com",
      telefono:"+1555232255"
    )
  end
  let!(:valid_attributes) do
    {
      fecha: Date.current,
      hora_inicio: "10:00",
      hora_fin: "18:00",
      nombre: "Primario"
    }
  end
  let!(:valid_session) { { username: "tester1", password: "password1" } }
  let!(:invalid_attributes) { { creador_id: nil, fecha: nil } }
  before do
    @headers = api_login(valid_session)
  end

  describe "Controller testing" do
    it "should get index" do
      Horario.create! valid_attributes.merge(creador_id: user.id)
      get :index, params: {}, headers: @headers
      expect(response).to be_successful
    end

    it "should create horario" do
      post :create,
        params: { horario: valid_attributes },
        headers: @headers
      expect(Horario.count).to eq(1)
      expect(response).to be_successful
    end

    it "should show horario" do
      horario = Horario.create! valid_attributes.merge(creador_id: user.id)
      get :show, params: { id: horario.to_param }, headers: @headers
      expect(response).to be_successful
      expect(response).to include("Primario")
    end

    it "should update horario" do
      horario = Horario.create! valid_attributes.merge(creador_id: user.id)
      patch :update,
        params: {
          id: horario.id,
          horario: {
            creador_id: user2.id
          }
        },
        headers: @headers
      expect(response).to be_successful
      expect(Horario.find(horario.id)).to include(creador_id: user2.id)
    end

    it "should destroy horario" do
      horario = Horario.create! valid_attributes.merge(creador_id: user.id)
      expect {
        delete :delete, params: { id: horario.id }, headers: @headers
      }.to change { Horario.count }.by(-1)
      expect(response.code).to eq(204)
    end
  end
end
