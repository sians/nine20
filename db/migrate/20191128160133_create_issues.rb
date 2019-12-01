class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :cover_image
      t.integer :issue_number

      t.timestamps
    end
  end
end
