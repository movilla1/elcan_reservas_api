json.extract! proveedor, :id, :nombre, :direccion, :telefono, :contacto, :email, :sitio_web, :created_at, :updated_at
json.url proveedor_url(proveedor, format: :json)
