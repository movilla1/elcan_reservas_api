class ArticuloCompra < ApplicationRecord
  belongs_to :articulo
  belongs_to :origen_compra, polymorphic: true
  belongs_to :creador, class_name: "Usuario"

  validates :precio_actual, numericality: { greater_than: 0 }, required: false
  validates :precio_anterior, numericality: { greater_than: 0 }, required: false
  validates :cantidad, numericality: { greater_than: 0 }, presence: true

  enum status: %i[abierto procesado cerrado]

end
