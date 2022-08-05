class AddEmployeeIdToSalaries < ActiveRecord::Migration[5.2]
  def change
    add_column :salaries, :employee_id, :integer
    add_index :salaries, :employee_id
  end
end
