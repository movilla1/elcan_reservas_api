class AddStatusToVentas < ActiveRecord::Migration[5.2]
  def change
    add_column :ventas, :status, :integer
  end
end
