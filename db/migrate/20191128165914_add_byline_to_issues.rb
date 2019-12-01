class AddBylineToIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :byline, :string
  end
end
