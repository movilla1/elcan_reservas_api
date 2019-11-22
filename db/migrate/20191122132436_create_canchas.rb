class CreateCanchas < ActiveRecord::Migration[5.2]
  def change
    create_table :canchas do |t|
      t.string :nombre
      t.string :descripcion
      t.references :usuarios
      t.float :precio_hora
      t.float :costo_extra1
      t.float :costo_extra2
      t.string :condicion_extra1
      t.string :condicion_extra2

      t.timestamps
    end
  end
end
