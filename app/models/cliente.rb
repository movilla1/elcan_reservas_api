class Cliente < ApplicationRecord
  belongs_to :creador, class_name: "Usuario"
  has_many :ventas, dependent: :nullify
  has_many :reservas, dependent: :nullify
end
