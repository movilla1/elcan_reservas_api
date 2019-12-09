FactoryBot.define do
  factory :horario do
    nombre { Faker::Lorem.characters(number: 8) }
    fecha { Faker::Date.between(from: 2.days.ago, to: Date.today) } #=> "Wed, 24 Sep 2014"
    hora_inicio { "10:00" }
    hora_fin { "18:00" }
    creador { nil }
  end
end
