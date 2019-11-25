class Caja < ApplicationRecord
  belongs_to :creador, class_name: "Usuario"
end
