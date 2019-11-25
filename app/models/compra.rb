class Compra < ApplicationRecord
  belongs_to :creador, class_name: "Usuario"
  belongs_to :articulo
  belongs_to :proveedor
  belongs_to :caja
  enum status: %i[abierta procesando cerrada devuelta]

end
