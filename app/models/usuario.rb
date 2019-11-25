class Usuario < ApplicationRecord
  has_secure_password
  enum rol: %i[cliente usuario contable administrador]
  has_many :articulos
  has_many :canchas
  has_many :reservas
  has_many :cajas

end
