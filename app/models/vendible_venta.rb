class VendibleVenta < ApplicationRecord
  belongs_to :venta
  belongs_to :vendible, polymorphic: true
  belongs_to :creador, class_name: "Usuario"
end
