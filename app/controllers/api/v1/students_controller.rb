class Api::V1::StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy]

  def index
    render json: Student.all
  end

  def show
    render json: @student
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created
    else
      default_error_render
    end
  end

  def update
    if @student.update(student_params)
      render json: @student, status: :ok
    else
      default_error_render
    end
  end

  def destroy
    @student.destroy
    :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    def default_error_render
      render json: @student.errors, status: :unprocessable_entity
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :cpf, :email, :phone, :date_birth)
    end
end