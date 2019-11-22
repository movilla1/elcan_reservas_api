FactoryBot.define do
  factory :cancha do
    nombre { "MyString" }
    descripcion { "MyString" }
    precio_hora { 1.5 }
    costo_extra1 { 1.5 }
    costo_extra2 { 1.5 }
    condicion_extra1 { "MyString" }
    condicion_extra2 { "MyString" }
  end
end
