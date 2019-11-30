class CreateArticulosCompra < ActiveRecord::Migration[5.2]
  def change
    create_table :articulos_compra do |t|
      t.references :articulo, foreign_key: true
      t.references :origen_compra, polymorphic: true, index: {name: "origen_de_compra"}
      t.float :precio_anterior
      t.float :precio_actual
      t.integer :cantidad
      t.integer :status
      t.references :creador, foreign_key: { to_table: :usuarios }

      t.timestamps
    end
  end
end
