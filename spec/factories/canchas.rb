FactoryBot.define do
  factory :cancha do
    nombre { Faker::Lorem.characters(number: 10) }
    descripcion { Faker::Lorem.characters(number: 15) }
    precio_hora { Faker::Number.decimal(l_digits: 2) }
    costo_extra1 { Faker::Number.decimal(l_digits: 2) }
    costo_extra2 { Faker::Number.decimal(l_digits: 2) }
    condicion_extra1 { nil }
    condicion_extra2 { nil }
  end
end
