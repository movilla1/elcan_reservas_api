class OrdenDeCompra < ApplicationRecord
  belongs_to :creador, class_name: "Usuario"
  has_many :articulo_compras, as: :origen_compra, dependent: :destroy

  validates :nota, length: { maximum: 200, minimum: 5 }, presence: false

  enum status: %i[abierta procesando devolucion pagado]

end
