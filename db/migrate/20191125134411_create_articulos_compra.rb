class CreateArticulosCompra < ActiveRecord::Migration[5.2]
  def change
    create_table :articulos_compra do |t|
      t.references :articulo, foreign_key: true
      t.references :orden_de_compra, foreign_key: true
      t.float :precio_anterior
      t.integer :cantidad
      t.integer :status
      t.references :creador, foreign_key: { to_table: :usuarios }

      t.timestamps
    end
  end
end
