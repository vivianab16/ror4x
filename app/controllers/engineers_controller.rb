class EngineersController < ApplicationController
  before_action :set_engineer, only: [:show, :edit, :update, :destroy, :index, :new, :create]

  # GET /engineers
  # GET /engineers.json
  def index
    @engineers = @proyect.Engineer.all
  end

  # GET /engineers/1
  # GET /engineers/1.json
  def show
  end

  # GET /engineers/new
  def new
    @engineer = Engineer.new
  end

  # GET /engineers/1/edit
  def edit
  end

  # POST /engineers
  # POST /engineers.json
  def create
    @engineer = Engineer.new(engineer_params)
    @engineer.proyect_id = @proyect.id
    respond_to do |format|
      if @engineer.save
        format.html { redirect_to proyect_engineers_path(@proyect), notice: 'Ingeniero se ha creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @engineer }
      else
        format.html { render :new }
        format.json { render json: @engineer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engineers/1
  # PATCH/PUT /engineers/1.json
  def update
    respond_to do |format|
      if @engineer.update(engineer_params)
        format.html { redirect_to proyect_engineers_path(@proyect), notice: 'Ingeniero ha sido actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @engineer }
      else
        format.html { render :edit }
        format.json { render json: @engineer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engineers/1
  # DELETE /engineers/1.json
  def destroy
    @engineer.destroy
    respond_to do |format|
      format.html { redirect_to proyect_engineers_url(@proyect), notice: 'Ingeniero ha sido eliminado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engineer
      @proyect = Proyect.find(params[:proyect_id])
      @engineer = Engineer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def engineer_params
      params.require(:engineer).permit(:fullname, :dependency, :studies, :proyect_id)
    end
end
