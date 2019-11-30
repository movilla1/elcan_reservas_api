class OrdenDeCompra < ApplicationRecord
  belongs_to :creador, class_name: "Usuario"
  has_many :articulo_compras, as: :origen_compra, dependent: :destroy

end
