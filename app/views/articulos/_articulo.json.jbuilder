json.extract! articulo, :id, :nombre, :descripcion, :codigo, :precio_compra, :precio_venta, :margen, :descuento, :tipo_descuento, :cantidad, :imagen, :creador_id, :created_at, :updated_at
json.url articulo_url(articulo, format: :json)
