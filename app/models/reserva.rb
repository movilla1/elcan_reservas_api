class Reserva < ApplicationRecord
  belongs_to :cliente
  belongs_to :creador, class_name: "Usuario"
  belongs_to :cancha
  has_many :vendible_ventas, as: :vendible, dependent: :nullify
  has_many :ventas, through: :vendible_ventas

  after_save :create_venta, on: :create

  private

  def create_venta
    venta = Venta.create!(
      nota: "Creado automaticamente por reserva #{id}",
      status: :abierta,
      creador: creador
    )
    VendibleVenta.create!(
      vendible: self,
      venta: venta,
      creador: creador
    )
  end
end
