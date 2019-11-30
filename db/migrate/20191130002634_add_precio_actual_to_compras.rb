class AddPrecioActualToCompras < ActiveRecord::Migration[5.2]
  def change
    add_column :compras, :precio_actual, :float
  end
end
