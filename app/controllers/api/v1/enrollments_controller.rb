class Api::V1::EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :update, :destroy]

  def index
    render json: Enrollment.all
  end

  def show
    render json: @enrollment
  end

  def create
    @enrollment = Enrrolment.new(enrollment_params)

    if @enrollment.save
      render json: @enrollment, status: :created
    else
      default_error_render
    end
  end

  def update
    if @enrollment.update(enrollment_params)
      render @enrollment, status: :ok
    else
      default_error_render
    end
  end

  def destroy
    @enrollment.destroy
    :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrrolment.find(params[:id])
    end

    def default_error_render
      render json: @enrollment.errors, status: :unprocessable_entity
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(:date_enrollment, :student_id, :teacher_id)
    end
end
