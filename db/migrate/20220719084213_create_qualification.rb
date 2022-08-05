class CreateQualification < ActiveRecord::Migration[5.2]
  def change
    create_table :qualifications do |t|
      t.string :designation
      t.string :experience
      t.string :pg_cgpa
      t.string :pg_year
      t.string :ug_cgpa
      t.string :ug_year
      t.string :diploma_cgpa
      t.string :diploma_year
      t.string :twelve_th_percent
      t.string :twelve_th_year
      t.string :ten_th_percent
      t.string :ten_th_year
    end
  end
end
