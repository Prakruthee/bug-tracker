class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :issue_name
      t.string :issue_type
      t.text :description
      t.text :comment
      t.string :status

      t.timestamps
    end
  end
end
