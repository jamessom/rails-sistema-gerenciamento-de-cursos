class Api::V1::SubjectsController < Api::V1::ApiController
  before_action :set_subject, only: [:show, :update, :destroy]

  def index
    render json: Subject.all
  end

  def show
    render json: @subject
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      render json: @subject, status: :created
    else
      default_error_render
    end
  end

  def update
    if @subject.update(subject_params)
      render json: @subject, status: :ok
    else
      default_error_render
    end
  end

  def destroy
    @subject.destroy
    :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def default_error_render
      render json: @subject.errors, status: :unprocessable_entity
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :requirement, :price, :workload)
    end
end