json.extract! articulo_compra, :id, :articulo_id, :creador_id, :orden_de_compra_id, :precio_anterior, :cantidad, :status, :created_at, :updated_at
json.url articulo_compra_url(articulo_compra, format: :json)
