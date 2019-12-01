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
  belongs_to :caja

  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validates :nota, length: { minimum: 3, maximum: 200 }, presence: false
  validates :status, presence: true

  enum status: %i[abierta procesando devolucion pagado]

  def cambiar_estado(nuevo_estado)
    self.status = nuevo_estado
    self.vendible_ventas.each do |vendible|
      vendible.status = nuevo_estado
    end
  end
end
