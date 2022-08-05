class AddColumnToLeave < ActiveRecord::Migration[5.2]
  def change
    add_column :leaves, :status, :string
    add_column :leaves, :type_of_leave, :string
    add_column :leaves, :days, :string
    add_column :leaves, :from_date, :string
    add_column :leaves, :to_date, :string
  end
end
