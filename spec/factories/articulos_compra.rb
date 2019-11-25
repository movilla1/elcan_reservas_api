FactoryBot.define do
  factory :articulo_compra do
    articulo { nil }
    creador { nil }
    orden_de_compra { nil }
    precio_anterior { 1.5 }
    cantidad { 1 }
    status { 1 }
  end
end
