class AddClienteToVentas < ActiveRecord::Migration[5.2]
  def change
    add_reference :ventas, :cliente, foreign_key: true
  end
end
