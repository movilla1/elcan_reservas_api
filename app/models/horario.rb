class Horario < ApplicationRecord
  belongs_to :creador, class_name: "Usuario"
  validates :fecha, presence: true
  validates :hora_inicio, presence: true
  validates :hora_fin, presence: true
end
