class RemoveTypeFromMedias < ActiveRecord::Migration[5.2]
  def change
    remove_column :medias, :type, :string
  end
end
