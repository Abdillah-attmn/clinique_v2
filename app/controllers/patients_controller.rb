class PatientsController < ApplicationController
  before_action :authenticate_user!, :authenticate_patient, except: %i[new create show]
  before_action :new_registration, only: %i[new create]
  before_action :set_patient, only: %i[show]

  # GET patient/:id
  def show; end

  # GET patients/new
  def new
    @patient = Patient.new
    @patient.build_user
  end

  # POST patients/new
  def create
    @patient = Patient.new(patient_params)

    if @patient.save!
      redirect_to @patient, notice: 'Votre compte a bien été créé.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:gender, :birth_date, :address, :zipcode, :city)
  end

  def authenticate_patient
    redirect_to new_user_session_path unless current_user.userable_type == "Patient"
  end

  def new_registration
    redirect_to patients_path if user_signed_in?
  end
end
