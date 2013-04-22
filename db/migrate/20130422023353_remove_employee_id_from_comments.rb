class RemoveEmployeeIdFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :employee_id
  end

  def down
    add_column :comments, :employee_id, :integer
  end
end
