json.extract! venta, :id, :total, :nota, :created_at, :updated_at
json.url venta_url(venta, format: :json)
