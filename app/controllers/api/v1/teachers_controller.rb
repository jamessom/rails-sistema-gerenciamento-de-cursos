class Api::V1::TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :update, :destroy]

  def index
    render json: Teacher.all
  end

  def show
    render json: @teacher
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      render json: @teacher, status: :created
    else
      default_error_render
    end
  end

def update
    if @teacher.update(teacher_params)
      render json: @teacher, status: :ok
    else
      default_error_render
    end
  end

  def destroy
    @teacher.destroy
    :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def default_error_render
      render json: @teacher.errors, status: :unprocessable_entity
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:Employer_id, :hour_value, :certificates)
    end
end