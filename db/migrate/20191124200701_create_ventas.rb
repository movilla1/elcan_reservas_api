class CreateVentas < ActiveRecord::Migration[5.2]
  def change
    create_table :ventas do |t|
      t.float :total
      t.string :nota
      t.references :creador, foreign_key: { to_table: :usuarios }

      t.timestamps
    end
  end
end
