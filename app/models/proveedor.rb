class Proveedor < ApplicationRecord
  self.table_name = "proveedores"
  validates :telefono,
    format: {
      with: %r[\A[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\.\/0-9]*\Z],
      message: "Telefono solo puede tener números, (), + y -"
    },
    length: { minimum: 6, maximum: 20 }
  validates :nombre, presence: true, length: { minimum: 2, maximum: 200 }
  belongs_to :creador, class_name: "Usuario"
  has_and_belongs_to_many :articulos, dependent: :nullify

end
