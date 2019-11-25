class Caja < ApplicationRecord
  belongs_to :creador, class_name: "Usuario"
  validates :fondo_inicial, numericality: { greater_than: 0 }
  validates :fecha, presence: true
  validate :fecha_actual_o_futuro
  has_many :compras, dependent: :nullify
  has_many :ventas, dependent: :nullify

  private

  def fecha_actual_o_futuro
    errors.add("Fecha en el pasado") unless fecha >= Date.today
  end
end
