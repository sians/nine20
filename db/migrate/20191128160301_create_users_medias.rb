class CreateUsersMedias < ActiveRecord::Migration[5.2]
  def change
    create_table :users_medias do |t|
      t.references :user, foreign_key: true
      t.references :media, foreign_key: true

      t.timestamps
    end
  end
end
