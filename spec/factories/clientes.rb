FactoryBot.define do
  factory :cliente do
    nombre { "MyString" }
    apellido { "MyString" }
    direccion { "MyString" }
    email { "MyString" }
    telefono { "MyString" }
    fecha_nacimiento { "2019-11-22" }
    creador { nil }
  end
end
