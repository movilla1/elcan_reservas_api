class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :apellido
      t.string :direccion
      t.string :email
      t.string :telefono
      t.date :fecha_nacimiento
      t.references :creador, foreign_key: { to_table: :usuarios }

      t.timestamps
    end
  end
end
