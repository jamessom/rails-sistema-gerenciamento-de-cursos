class Api::V1::TrainersController < ApplicationController
  before_action :set_trainer, only: [:show, :update, :destroy]

  def index
    render json: Trainer.all
  end

  def show
    render json: @trainer
  end

  def create
    @trainer = Trainer.new(trainer_params)

    if @trainer.save
      render json: @trainer, status: :created
    else
      default_error_render
    end
  end

  def update
    if @trainer.update(trainer_params)
      render json: @trainer, status: :ok
    else
      default_error_render
    end
  end

  def destroy
    @trainer.destroy
    :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainer
      @trainer = Trainer.find(params[:id])
    end

    def default_error_render
      render json: @trainer.errors, status: :unprocessable_entity
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainer_params
      params.require(:trainer).permit(:name, :email, :hour_value, :certificates)
    end
end