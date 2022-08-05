class AddEmployeeIdToLeaves < ActiveRecord::Migration[5.2]
  def change
    add_column :leaves, :employee_id, :integer
    add_index :leaves, :employee_id
  end
end
