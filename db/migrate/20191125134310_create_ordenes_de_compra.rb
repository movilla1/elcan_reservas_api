class CreateOrdenesDeCompra < ActiveRecord::Migration[5.2]
  def change
    create_table :ordenes_de_compra do |t|
      t.references :creador, foreign_key: { to_table: :usuarios }
      t.string :nota
      t.integer :status

      t.timestamps
    end
  end
end
