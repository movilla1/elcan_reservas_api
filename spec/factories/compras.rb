FactoryBot.define do
  factory :compra, class: 'Compras' do
    status { 1 }
    cantidad { 1 }
    precio_unitario { 1.5 }
    precio_total { 1.5 }
    creador { nil }
    articulo { nil }
    proveedor { nil }
    caja { nil }
  end
end
