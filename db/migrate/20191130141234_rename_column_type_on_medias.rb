class RenameColumnTypeOnMedias < ActiveRecord::Migration[5.2]
  def change_column
    rename_column :medias, :type, :media_type
  end
end
