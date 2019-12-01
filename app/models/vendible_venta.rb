class VendibleVenta < ApplicationRecord
  belongs_to :venta
  belongs_to :vendible, polymorphic: true
  belongs_to :creador, class_name: "Usuario"
  validates :cantidad, presence: true, numericality: { greater_than: 0 }
  validates :subtotal, numericality: { greater_than: 0 }

end
