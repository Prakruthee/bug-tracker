class AddUseridToIssue < ActiveRecord::Migration
  def change
    add_reference :issues, :user, index: true
  end
end
