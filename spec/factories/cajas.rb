FactoryBot.define do
  factory :caja do
    fecha {
      Faker::Date.between(
        from: Time.zone.today,
        to: Time.zone.today + 8.hours
      )
    }
    fondo_inicial { Faker::Number.decimal(l_digits: 3) }
    creador { nil }
  end
end
