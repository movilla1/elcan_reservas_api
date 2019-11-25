class CreateVendiblesVenta < ActiveRecord::Migration[5.2]
  def change
    create_table :vendibles_venta do |t|
      t.references :venta, foreign_key: true
      t.references :creador, foreign_key: { to_table: :usuarios }
      t.references :vendible, polymorphic: true
      t.integer :cantidad
      t.float :subtotal
      t.timestamps
    end
  end
end
