class AddApprovedToComments < ActiveRecord::Migration
  def up
    add_column :comments, :approved, :integer
  end
  def down
    remove_column :comments, :approved, :integer
  end
end
