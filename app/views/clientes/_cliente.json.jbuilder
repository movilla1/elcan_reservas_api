json.extract! cliente, :id, :nombre, :apellido, :direccion, :email, :telefono, :fecha_nacimiento, :creador_id, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
