class AddRatingToCommentsandDueDateToAssignments < ActiveRecord::Migration
  def up
    add_column :comments, :rating, :integer
    add_column :assignments, :due_date, :date
  end
  def down
    remove_column :comments, :rating, :integer
    remove_column :assignments, :due_date, :date
  end
end
