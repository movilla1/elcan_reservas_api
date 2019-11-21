class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :nombre
      t.string :apellido
      t.string :telefono
      t.string :direccion
      t.string :ciudad
      t.string :provincia
      t.string :pais

      t.timestamps
    end
  end
end
