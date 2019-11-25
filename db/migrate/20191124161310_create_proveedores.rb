class CreateProveedores < ActiveRecord::Migration[5.2]
  def change
    create_table :proveedores do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.string :contacto
      t.string :email
      t.string :sitio_web
      t.references :creador, foreign_key: { to_table: :usuarios }

      t.timestamps
    end
  end
end
