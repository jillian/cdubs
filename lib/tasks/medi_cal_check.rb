require 'watir'
require 'CSV'
require 'pp'
require 'activerecord'

login_url = "https://www.medi-cal.ca.gov/Eligibility/Login.asp"
eligibility_url = "https://www.medi-cal.ca.gov/Eligibility/Eligibility.asp"
username  = %MC_LOGIN%
password  = %MC_PW%


b = Watir::Browser.start login_url
u = b.text_field id: "UserID"
u.set username
pw = b.text_field id: "UserPW"
pw.set password
btn = b.button value: "Submit"
btn.click

e = b.link text: "Single Subscriber"
e.click

r_id = b.text_field id: "RecipID"
r_dob = b.text_field id: "RecipDOB"
r_doi = b.text_field id: "RecipDOI"
r_dos = b.text_field id: "RecipDOS"


require 'csv'
# require 'active_record'
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


ActiveRecord::Base.establish_connection ({  :adapter => "postgres",
  :host => "localhost",
  :username => "postgres",
  :password => "redbaron50",
  :database => "db/development.db"})