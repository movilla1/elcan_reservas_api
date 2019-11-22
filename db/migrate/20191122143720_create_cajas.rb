class CreateCajas < ActiveRecord::Migration[5.2]
  def change
    create_table :cajas do |t|
      t.date :fecha
      t.float :fondo_inicial
      t.references :creador, foreign_key: { to_table: :usuarios }

      t.timestamps
    end
  end
end
