require 'csv'

CSV.foreach('patients.csv', headers: true) do |row|
  p = Patient.new({
      first_name:      row['PT_FNAME'],
      last_name:       row['PT_LNAME'],
      dob:             row['PT_DOB'],
      hicn:            row['PT_MCARE'],
      medi_cal_number: row['PT_MDCD'],
      phone_number:    row['PT_PHONE'],
      gender:          row['PT_SEX']
      })
  p.save
end