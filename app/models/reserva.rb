class Reserva < ApplicationRecord
  belongs_to :cliente
  belongs_to :creador, class_name: "Usuario"
  belongs_to :cancha
  has_many :vendible_ventas, as: :vendible, dependent: :nullify
  has_many :ventas, through: :vendible_ventas
end
