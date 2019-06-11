class Api::V1::GradesController < ApplicationController
  before_action :set_grade, only: [:show, :update, :destroy]

  def index
    render json: Grade.all
  end

  def show
    render json: @grade
  end

  def create
    @grade = Grade.new(grade_params)

    if @grade.save
      render json: @grade, status: :created
    else
      default_error_render
    end
  end

  def update
    if @grade.update(grade_params)
      render json: @grade, status: :ok
    else
      default_error_render
    end
  end

  def destroy
    @grade.destroy
    format.json { head :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    def default_error_render
      render json: @grade.errors, status: :unprocessable_entity
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:Trainer_id, :Course_id, :initial_date, :end_date, :workload)
    end
end
