class AddAttachmentImagenToArticulos < ActiveRecord::Migration[5.2]
  def self.up
    change_table :articulos do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :articulos, :imagen
  end
end
