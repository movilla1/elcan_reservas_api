FactoryBot.define do
  factory :cliente do
    nombre { Faker::Lorem.characters(number: 15) }
    apellido { Faker::Lorem.characters(number: 15) }
    direccion { Faker::Lorem.characters(number: 20)  }
    email { Faker::Internet.email }
    telefono { Faker::PhoneNumber.cell_phone  }
    fecha_nacimiento {  Faker::Date.between(from: 25.years.ago, to: 20.years.ago)  }
    creador { nil }
  end
end
