class Api::V1::TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]

  def index
    render json: Team.all
  end

  def show
    render json: @team
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      render json: @team, status: :created
    else
      default_error_render
    end
  end

  def update
    if @team.update(team_params)
      render json: @team, status: :ok
    else
      default_error_render
    end
  end

  def destroy
    @team.destroy
    format.json { head :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    def default_error_render
      render json: @team.errors, status: :unprocessable_entity
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:Trainer_id, :Course_id, :initial_date, :end_date, :workload)
    end
end
