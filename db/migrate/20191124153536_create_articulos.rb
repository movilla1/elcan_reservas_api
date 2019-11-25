class CreateArticulos < ActiveRecord::Migration[5.2]
  def change
    create_table :articulos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :codigo
      t.float :precio_compra
      t.float :precio_venta
      t.float :margen
      t.float :descuento
      t.string :tipo_descuento
      t.integer :cantidad
      t.references :creador, foreign_key: { to_table: :usuarios }

      t.timestamps
    end
  end
end
