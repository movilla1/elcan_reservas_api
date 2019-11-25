class Compra < ApplicationRecord
  belongs_to :creador, class_name: "Usuario"
  belongs_to :articulo
  belongs_to :proveedor
  belongs_to :caja
  belongs_to :orden_de_compra, optional: true
  enum status: %i[abierta procesando cerrada devuelta]

end
