class V1::DoctorsController < ApplicationController
  load_and_authorize_resource
  before_action :set_doctor, only: %i[show destroy]

  def index
    @doctors = Doctor.all
  end

  def show; end

  # POST /doctors
  def create
    @doctor = Doctor.new(doctor_params)
    current_user.doctors << @doctor
    if @doctor.save
      render :show, status: :created
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @doctor.destroy
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:fullname, :specialty, :city, :picture)
  end
end
