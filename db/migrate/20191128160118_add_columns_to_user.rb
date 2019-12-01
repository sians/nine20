class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :string
    add_column :users, :avatar, :string
    add_column :users, :bio, :text
    add_column :users, :byline, :text
    add_column :users, :website, :string
  end
end
