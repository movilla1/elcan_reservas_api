# frozen_string_literal: true

class Articulo < ApplicationRecord
  belongs_to :creador, class_name: "Usuario"
  has_and_belongs_to_many :proveedores
  has_many :vendible_ventas, as: :vendible, dependent: :nullify
  has_many :ventas, through: :vendible_ventas
  has_attached_file :imagen,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/placeholder.png"
  validates_attachment :imagen
  validates :precio_compra, presence: true, numericality: { greater_than: 0 }
  validates :precio_venta, presence: true, numericality: { greater_than: 0 }
  validates :margen, presence: true, numericality: { greater_than: 0 }
  validates :nombre, length: { minimum: 3 }
  validates :codigo, length: { minimum: 3 }
  validates :cantidad, numericality: { greater_than: 0 }
  before_validation :calcular_precios

  private

  def calcular_precios
    if precio_venta.present?
      self.margen = (precio_venta / precio_compra) * 100
    elsif margen.present?
      self.precio_venta = precio_compra * (margen / 100)
    end
  end
end
