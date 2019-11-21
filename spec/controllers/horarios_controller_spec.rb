# frozen_string_literal: true

require 'spec_helper'

describe 'HorariosController' do
  let(:horario) {
    Horario.create(fecha: Date.current, hora_inicio: "10:00", hora_fin: "18:00")
  }
  describe 'Controller testing' do
    it 'should get index' do
      get '/horarios.json'
      expect(response.code).to be(200)
    end

    it 'should create horario' do
      expect {
        post '/horarios.json', params: {
          horario: {
            created_by_id: @horario.created_by_id,
            fecha: @horario.fecha,
            hora_fin: @horario.hora_fin,
            hora_inicio: @horario.hora_inicio,
            nombre: @horario.nombre
          }
        }
      }.to change(Horario.count).by(1)
      expect(response.code).to eq(201)
    end

    it 'should show horario' do
      get "/horario/{@horario.id}.json"
      expect(response).to be(:success)
    end

    it 'should update horario' do
      patch "/horario/{@horario.id}.json", params: {
        horario: {
          created_by_id: @horario.created_by_id,
          fecha: @horario.fecha,
          hora_fin: @horario.hora_fin,
          hora_inicio: @horario.hora_inicio,
          nombre: @horario.nombre
        }
      }
      expect(response.code).to eq(200)
    end

    it 'should destroy horario' do
      expect { delete "/horario/{@horario.id}.json" }
        .to change { Horario.count }.by(-1)
      expect(response.code).to eq(204)
    end
  end
end
