FactoryBot.define do
  factory :articulo do
    nombre { "MyString" }
    descripcion { "MyString" }
    codigo { "MyString" }
    precio_compra { 1.5 }
    precio_venta { 1.5 }
    margen { 1.5 }
    descuento { 1.5 }
    tipo_descuento { "MyString" }
    cantidad { 1 }
    imagen { "MyString" }
    creador { nil }
  end
end
