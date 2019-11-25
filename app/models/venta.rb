class Venta < ApplicationRecord
  has_many :vendible_ventas, dependent: :destroy
  has_many :reservas,
    through: :vendible_ventas,
    source: "vendible",
    source_type: "Reserva"
  has_many :articulos,
    through: :vendible_ventas,
    source: "vendible",
    source_type: "Articulo"
  belongs_to :creador, class_name: "Usuario"

  enum status: %i[abierta procesando devuelta pagada]
end
