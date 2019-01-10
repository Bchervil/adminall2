class InstructorsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:destroy]

  def index
    @instructors = Instructor.all.order(:l_name)
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def new
    @instructor = Instructor.new
  end

  def create
    Instructor.create(instructor_params)
    flash[:success] = "Instructor has been successfully created."
    redirect_to instructors_path
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    instructor = Instructor.find(params[:id])
    instructor.update(instructor_params)
    redirect_to instructor_path
  end

  def destroy
    Instructor.find(params[:id]).destroy
		redirect_to '/instructors'
    # @instructor = Instructor.destroy(params[:id])
    # @instructor.delete(instructor_path)
    # redirect_to instructors_path
    # render json: {status: 'success', message: 'Instructor was successfully deleted'}
  end

  private

  def instructor_params
    params.require(:instructor).permit(:f_name, :l_name, :birthday, :age, :salary, :education)
  end

end
