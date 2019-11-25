# frozen_string_literal: true

class Articulo < ApplicationRecord
  belongs_to :creador, class_name: "Usuario"
  belongs_to :proveedor, class_name: "Proveedor"
  has_many :vendible_ventas, as: :vendible, dependent: :nullify
  has_many :ventas, through: :vendible_ventas
  has_attached_file :imagen,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/placeholder.png"
  validates_attachment :imagen, presence: true

end
