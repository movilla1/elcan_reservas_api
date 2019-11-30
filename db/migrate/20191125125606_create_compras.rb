class CreateCompras < ActiveRecord::Migration[5.2]
  def change
    create_table :compras do |t|
      t.integer :status
      t.float :precio_total
      t.references :creador, foreign_key: { to_table: :usuarios }
      t.references :proveedor, foreign_key: true
      t.references :caja, foreign_key: true

      t.timestamps
    end
  end
end
