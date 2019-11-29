class Cliente < ApplicationRecord
  belongs_to :creador, class_name: "Usuario"
  has_many :ventas, dependent: :nullify
  has_many :reservas, dependent: :nullify

  validates :nombre, length: { minimum: 4, maximum: 255 }, presence: true
  validates :apellido, length: { minimum: 3, maximum: 255 }, presence: true
  validates :creador_id, presence: true
  validates :telefono,
    format: {
      with: %r[\A[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\.\/0-9]*\Z],
      message: "Telefono solo puede tener números, (), + y -"
    },
    presence: true,
    length: { minimum: 6, maximum: 20 }
  validates :email,
    format: {
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/,
      message: "E-Mail inválido"
    }

end
