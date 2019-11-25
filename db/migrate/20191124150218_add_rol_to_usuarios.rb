class AddRolToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :rol, :integer, default: 0
  end
end
