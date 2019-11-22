# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HorariosController, type: :controller do
  let(:user) {
    Usuario.create(username: "tester1", password_digest: "password1", nombre: "Mario", email: "test@here.com", telefono:"+1555232233")
  }
  let(:user2) {
    Usuario.create(username: "tester2", password_digest: "password2", nombre: "Franchu", email: "test2@hereandthere.com", telefono:"+1555232255")
  }
  let(:valid_attributes) {
    { fecha: Date.current, hora_inicio: "10:00", hora_fin: "18:00", nombre: "Primario" }
  }
  let(:valid_session) { { username: "tester1", password: "password1" } }
  let(:invalid_attributes) { { created_by_id: nil, fecha: nil } }

  describe 'Controller testing' do
    it 'should get index' do
      Horario.create! valid_attributes.merge(created_by_id: user.id)
      get :index, params: {}, headers: api_login(valid_session)
      expect(response).to be_successful
    end

    it 'should create horario' do
      expect {
        post :create, params: {
          horario: valid_attributes
        }, headers: api_login(valid_session)
      }.to change(Horario, :count).by(1)
      expect(response).to be_successful
    end

    it 'should show horario' do
      horario = Horario.create! valid_attributes.merge(created_by_id: user.id)
      get :show, params: { id: horario.to_param }, headers: api_login(valid_session)
      expect(response).to be_successful
      expect(response).to include("Primario")
    end

    it 'should update horario' do
      horario = Horario.create! valid_attributes.merge(created_by_id: user.id)
      patch :update, params: {
        id: horario.id,
        horario: {
          created_by_id: user2.id
        }
      }, headers: api_login(valid_session)
      expect(response).to be_successful
      expect(Horario.find(horario.id)).to include(created_by_id: user2.id)
    end

    it 'should destroy horario' do
      horario = Horario.create! valid_attributes.merge(created_by_id: user.id)
      expect {
        delete :delete, params: { id: horario.id }, headers: api_login(valid_session)
      }.to change { Horario.count }.by(-1)
      expect(response.code).to eq(204)
    end
  end
end
