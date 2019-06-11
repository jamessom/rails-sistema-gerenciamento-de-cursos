class Api::V1::CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]

  def index
    render json: Course.all
  end

  def show
    render json: @course
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created
    else
      default_error_render
    end
  end

  def update
    if @course.update(course_params)
      render json: @course, status: :ok
    else
      default_error_render
    end
  end

  def destroy
    @course.destroy
    :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    def default_error_render
      render json: @course.errors, status: :unprocessable_entity
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :requiriment, :workload, :price)
    end
end