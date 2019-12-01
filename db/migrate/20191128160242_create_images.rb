class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :media, foreign_key: true
      t.references :issue, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :primary

      t.timestamps
    end
  end
end
