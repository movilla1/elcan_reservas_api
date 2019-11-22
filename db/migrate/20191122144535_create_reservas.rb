class CreateReservas < ActiveRecord::Migration[5.2]
  def change
    create_table :reservas do |t|
      t.float :adelanto
      t.timestamp :fecha_inicio
      t.timestamp :fecha_fin
      t.references :cliente, foreign_key: true
      t.references :creador, foreign_key: { to_table: :usuarios }
      t.references :cancha, foreign_key: true

      t.timestamps
    end
  end
end
