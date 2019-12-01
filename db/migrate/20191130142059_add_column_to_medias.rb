class AddColumnToMedias < ActiveRecord::Migration[5.2]
  def change
    add_column :medias, :media_type, :string
  end
end
