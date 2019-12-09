json.extract! horario, :id, :nombre, :fecha, :hora_inicio, :hora_fin, :creador_id, :created_at, :updated_at
json.url horario_url(horario, format: :json)
