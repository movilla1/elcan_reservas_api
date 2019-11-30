class Compra < ApplicationRecord
  belongs_to :creador, class_name: "Usuario"
  belongs_to :proveedor
  belongs_to :caja
  belongs_to :orden_de_compra, optional: true

  has_many :articulo_compras, as: :origen_compra, dependent: :destroy
  has_many :articulos, through: :articulo_compras

  validates :status, presence: true

  enum status: %i[abierta procesando cerrada devuelta]

  def procesar_compra
    errores = []
    update_column(:status, :procesando)
    articulo_compras.each do |art_compra|
      row_result = art_compra
        .articulo
        .update_columns(
          cantidad: (art_compra.articulo.cantidad + art_compra.cantidad),
          precio_compra: art_compra.precio_actual
        )
      errores.push "Falla articulo ##{art_compra.articulo.id}" unless row_result
    end
    errores
  end
end
