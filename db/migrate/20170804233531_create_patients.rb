class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string  :first_name
      t.string  :last_name
      t.integer :phone_number
      t.date    :dob
      t.string  :hicn
      t.string  :medi_cal_number
      t.string :gender, :limit => 1
      t.timestamps
    end
  end
end
