class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :description
      t.integer :class_id

      t.timestamps
    end
  end
end
