class AddEmployeeIdToQualifications < ActiveRecord::Migration[5.2]
  def change
    add_column :qualifications, :employee_id, :integer
    add_index :qualifications, :employee_id
  end
end
