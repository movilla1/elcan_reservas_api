class Horario < ApplicationRecord
  belongs_to :usuario, foreign_key: :created_by_id
  validates :fecha, presence: true
  validates :hora_inicio, presence: true
  validates :hora_fin, presence: true
end
