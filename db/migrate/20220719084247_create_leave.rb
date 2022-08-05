class CreateLeave < ActiveRecord::Migration[5.2]
  def change
    create_table :leaves do |t|
      t.string :sick, default: 5
      t.string :privileged, default: 15
      t.string :breavement, default: 7
      t.string :study_leave, default: 7
      t.string :time_off, default: 5
      t.string :maternity, default: 84
      t.string :paternity, default: 7
      t.string :optional, default: 5
    end
  end
end
