class EnginesController < ApplicationController
  before_action :authenticate_user!
  before_action only: [:new, :create] do
    authorize_request(["operator", "admin"])
  end
  before_action only: %i[ show edit update destroy ] do
    authorize_request(["admin"])
  end
  # GET /engines or /engines.json
  def index
    @engines = Engine.all
    @pagy, @engines = pagy(@engines)
  end



  # GET /engines/1 or /engines/1.json
  def show
    @engine = Engine.find(params[:id])
  end

  # GET /engines/new
  def new
    @engine = Engine.new
  end

  # GET /engines/1/edit
  def edit
  end

  # POST /engines or /engines.json
  def create
    @engine = Engine.new(engine_params)

    respond_to do |format|
      if @engine.save
        format.html { redirect_to engine_url(@engine), notice: "Engine was successfully created." }
        format.json { render :show, status: :created, location: @engine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @engine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engines/1 or /engines/1.json
  def update
    respond_to do |format|
      if @engine.update(engine_params)
        format.html { redirect_to engine_url(@engine), notice: "Engine was successfully updated." }
        format.json { render :show, status: :ok, location: @engine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @engine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engines/1 or /engines/1.json
  def destroy
    @engine = Engine.find(params[:id])

    if @engine.destroy
      respond_to do |format|
        format.html { redirect_to engines_url, notice: "Engine was successfully destroyed." }
      end
    else
      # Manejar el caso en el que el mantenimiento no pudo ser eliminado
      respond_to do |format|
        format.html { redirect_to engines_url, alert: "Unable to destroy engines." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engine
      @engine = Engine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def engine_params
      params.require(:engine).permit(:type_engine, :maintenance_id)
    end

    def authenticate_admin
      unless current_user && current_user.admin?
        flash[:alert] = "Acceso no autorizado. Debes ser un administrador para realizar esta acción."
        redirect_to engines_path
      end
    end
end
