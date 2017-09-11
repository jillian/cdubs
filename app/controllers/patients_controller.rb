class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  private

    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :dob, :medi_cal_number, :hicn, :gender)
    end

end
