class EnrrolmentsController < ApplicationController
  before_action :set_enrrolment, only: [:show, :edit, :update, :destroy]

  # GET /enrrolments
  # GET /enrrolments.json
  def index
    @enrrolments = Enrrolment.all
  end

  # GET /enrrolments/1
  # GET /enrrolments/1.json
  def show
  end

  # GET /enrrolments/new
  def new
    @enrrolment = Enrrolment.new
  end

  # GET /enrrolments/1/edit
  def edit
  end

  # POST /enrrolments
  # POST /enrrolments.json
  def create
    @enrrolment = Enrrolment.new(enrrolment_params)

    respond_to do |format|
      if @enrrolment.save
        format.html { redirect_to @enrrolment, notice: 'Enrrolment was successfully created.' }
        format.json { render :show, status: :created, location: @enrrolment }
      else
        format.html { render :new }
        format.json { render json: @enrrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrrolments/1
  # PATCH/PUT /enrrolments/1.json
  def update
    respond_to do |format|
      if @enrrolment.update(enrrolment_params)
        format.html { redirect_to @enrrolment, notice: 'Enrrolment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrrolment }
      else
        format.html { render :edit }
        format.json { render json: @enrrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrrolments/1
  # DELETE /enrrolments/1.json
  def destroy
    @enrrolment.destroy
    respond_to do |format|
      format.html { redirect_to enrrolments_url, notice: 'Enrrolment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrrolment
      @enrrolment = Enrrolment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrrolment_params
      params.require(:enrrolment).permit(:date_enrrolment, :Student_id, :Team_id)
    end
end
