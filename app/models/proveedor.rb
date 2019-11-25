class Proveedor < ApplicationRecord
  self.table_name = "proveedores"
  belongs_to :creador, class_name: "Usuario"
  has_many :articulos
end
