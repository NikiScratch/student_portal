class AddAssignmentIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :assignment_id, :integer
    add_index :comments, :assignment_id
  end
end
