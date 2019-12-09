# frozen_string_literal: true

FactoryBot.define do
  factory :articulo, class: Articulo do
    nombre { Faker::Lorem.nombre }
    descripcion { Faker::Lorem.descripcion }
    codigo { Faker::Code.ean }
    precio_compra { Faker::Number.decimal(l_digits: 2) }
    precio_venta { nil }
    margen { 20 }
    descuento { 1.5 }
    tipo_descuento { "percentage" }
    cantidad { Faker::Number.between(from: 1, to: 50) }
    imagen { "http://www.google.com/?q=free+image+nice+jpg" }
    creador { 1 }
  end
end
