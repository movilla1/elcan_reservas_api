FactoryBot.define do
  factory :reserva do
    adelanto { 1.5 }
    fecha_inicio { "2019-11-22 11:45:35" }
    fecha_fin { "2019-11-22 11:45:35" }
    cliente { nil }
    creador { nil }
    cancha { nil }
  end
end
