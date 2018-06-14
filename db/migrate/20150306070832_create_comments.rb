class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_description
      t.references :user, index: true
      t.references :issue, index: true

      t.timestamps
    end
  end
end
