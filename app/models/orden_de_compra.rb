class OrdenDeCompra < ApplicationRecord
  belongs_to :creador, class_name: "Usuario"
  has_many :articulo_compras, dependent: :destroy

end
