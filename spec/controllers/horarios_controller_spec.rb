# frozen_string_literal: true

require 'spec_helper'

describe 'HorariosController' do
  before do
    @horario = Horario.create(fecha: Date.current, hora_inicio: "10:00", hora_fin: "18:00")
  end
  describe 'Controller testing' do
    it 'should get index' do
      get horarios_url, as: :json
      expect(response).to be(:success)
    end

    it 'should create horario' do
      assert_difference('Horario.count') do
        post horarios_url, params: { horario: { created_by_id: @horario.created_by_id, fecha: @horario.fecha, hora_fin: @horario.hora_fin, hora_inicio: @horario.hora_inicio, nombre: @horario.nombre } }, as: :json
      end

      expect(response.code).to eq(201)
    end

    it 'should show horario' do
      get horario_url(@horario), as: :json
      expect(response).to be(:success)
    end

    it 'should update horario' do
      patch horario_url(@horario), params: { horario: { created_by_id: @horario.created_by_id, fecha: @horario.fecha, hora_fin: @horario.hora_fin, hora_inicio: @horario.hora_inicio, nombre: @horario.nombre } }, as: :json
      expect(response.code).to eq(200)
    end

    it 'should destroy horario' do
      assert_difference('Horario.count', -1) do
        delete horario_url(@horario), as: :json
      end

      expect(response.code).to eq(204)
    end
  end
end
