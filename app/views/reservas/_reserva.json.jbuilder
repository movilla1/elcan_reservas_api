json.extract! reserva, :id, :adelanto, :fecha_inicio, :fecha_fin, :cliente_id, :creador_id, :cancha_id, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
