FactoryBot.define do
  factory :ordene_de_compra, class: 'OrdenDeCompra' do
    creador { nil }
    nota { "MyString" }
    status { 1 }
  end
end
