class Api::V1::EmployersController < ApplicationController
    before_action :set_employer, only: [:show, :update, :destroy]
  
    def index
      render json: Employer.all
    end
  
    def show
      render json: @employer
    end
  
    def create
      @employer = Employer.new(employer_params)
  
      if @employer.save
        render json: @employer, status: :created
      else
        default_error_render
      end
    end
  
  def update
      if @employer.update(employer_params)
        render json: @employer, status: :ok
      else
        default_error_render
      end
    end
  
    def destroy
      @employer.destroy
      :no_content
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_employer
        @employer = Employer.find(params[:id])
      end
  
      def default_error_render
        render json: @employer.errors, status: :unprocessable_entity
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def employer_params
        params.require(:employer).permit(:name, :email, :phone, :date_birth)
      end
  end