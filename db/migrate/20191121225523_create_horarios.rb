class CreateHorarios < ActiveRecord::Migration[5.2]
  def change
    create_table :horarios do |t|
      t.string :nombre
      t.date :fecha
      t.string :hora_inicio
      t.string :hora_fin
      t.references :created_by, foreign_key: {to_table: :usuarios}

      t.timestamps
    end
  end
end
