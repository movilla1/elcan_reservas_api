class CreateJoinTableArticuloProveedor < ActiveRecord::Migration[5.2]
  def change
    create_join_table :articulos, :proveedores do |t|
      t.references :creador, foreign_key: { to_table: :usuarios }
      t.index [:articulo_id, :proveedore_id]
      t.index [:proveedore_id, :articulo_id]
    end
  end
end
