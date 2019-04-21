class Api::V1::EnrrolmentsController < ApplicationController
  before_action :set_enrrolment, only: [:show, :update, :destroy]

  def index
    render json: Enrrolment.all
  end

  def show
    render json: @enrrolment
  end

  def create
    @enrrolment = Enrrolment.new(enrrolment_params)

    if @enrrolment.save
      render json: @enrrolment, status: :created
    else
      default_error_render
    end
  end

  def update
    if @enrrolment.update(enrrolment_params)
      render @enrrolment, status: :ok
    else
      default_error_render
    end
  end

  def destroy
    @enrrolment.destroy
    :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrrolment
      @enrrolment = Enrrolment.find(params[:id])
    end

    def default_error_render
      render json: @enrrolment.errors, status: :unprocessable_entity
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrrolment_params
      params.require(:enrrolment).permit(:date_enrrolment, :Student_id, :Team_id)
    end
end
