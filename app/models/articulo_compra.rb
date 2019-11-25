class ArticuloCompra < ApplicationRecord
  belongs_to :articulo
  belongs_to :orden_de_compra
  belongs_to :creador, class_name: "Usuario"
end
