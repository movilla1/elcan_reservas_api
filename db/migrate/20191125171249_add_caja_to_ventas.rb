class AddCajaToVentas < ActiveRecord::Migration[5.2]
  def change
    add_reference :ventas, :caja, foreign_key: true
  end
end
