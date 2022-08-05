class CreateSalary < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.string :basic_pay
      t.string :hra
      t.string :statutory_bonus
      t.string :special_allowance
    end
  end
end
