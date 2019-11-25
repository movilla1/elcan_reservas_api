class AddOrdenDeCompraToCompras < ActiveRecord::Migration[5.2]
  def change
    add_reference :compras, :orden_de_compra, foreign_key: true
  end
end
