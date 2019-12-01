class Reserva < ApplicationRecord
  belongs_to :cliente
  belongs_to :creador, class_name: "Usuario"
  belongs_to :cancha
  has_many :vendible_ventas, as: :vendible, dependent: :nullify
  has_many :ventas, through: :vendible_ventas

  validates :adelanto, numericality: { greater_than_or_equal_to: 0 }
  validate :fechas_actual_o_futuro

  def crear_venta(caja)
    venta = Venta.create!(
      nota: "Creado automaticamente por reserva #{id}",
      status: :abierta,
      caja: caja,
      creador: creador,
      total: adelanto
    )
    VendibleVenta.create!(
      cantidad: 1,
      creador: creador,
      subtotal: adelanto,
      vendible: self,
      venta: venta
    )
  end

  private

  def fechas_actual_o_futuro
    errors.add(:fecha_inicio, "Fecha de inicio en el pasado") if fecha_inicio < Time.zone.today 
    errors.add(:fecha_fin, "Fecha de final en el pasado") if fecha_fin < Time.zone.today
    errors.add(:fechas, "La fecha de fin debe ser posterior al inicio") if fecha_inicio >= fecha_fin
  end
end
