class Reserva < ApplicationRecord
  belongs_to :cliente
  belongs_to :creador
  belongs_to :cancha
end
