class UpdateColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :photos, :title, :photo_name
    add_column :photos, :tag, :string
  end
end
