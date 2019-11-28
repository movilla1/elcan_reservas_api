class CreateCanchas < ActiveRecord::Migration[5.2]
  def change
    create_table :canchas do |t|
      t.string :nombre
      t.string :descripcion
      t.references :creador, foreign_key: { to_table: "usuarios" }
      t.float :precio_hora
      t.float :costo_extra1
      t.float :costo_extra2
      t.json :condicion_extra1
      t.json :condicion_extra2

      t.timestamps
    end
  end
end
