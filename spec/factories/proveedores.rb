FactoryBot.define do
  factory :proveedor do
    nombre {  Faker::Lorem.characters(number: 15)  }
    direccion {  Faker::Lorem.characters(number: 28)  }
    telefono { Faker::PhoneNumber.cell_phone }
    contacto { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    sitio_web { Faker::Internet.url }
    creador_id { nil }
  end
end
