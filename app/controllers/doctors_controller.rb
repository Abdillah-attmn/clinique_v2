class DoctorsController < ApplicationController
  before_action :authenticate_user!, :authenticate_doctor, except: %i[index new create show]
  before_action :new_registration, only: %i[new create]
  before_action :set_doctor, only: %i[show]

  def index
    @doctors = Doctor.all
  end

  def show;end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save!
      redirect_to @doctor, notice: 'Votre compte a bien été créé.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:speciality)
  end

  def authenticate_doctor
    redirect_to new_user_session_path unless current_user.userable_type == "Doctor"
  end

  def new_registration
    redirect_to doctors_path if user_signed_in?
  end
end
