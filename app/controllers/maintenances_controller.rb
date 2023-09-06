class MaintenancesController < ApplicationController
  before_action :authenticate_user!

# Define un método para autorizar al usuario
def authorize_user
  # Verifica el rol del usuario y autoriza en consecuencia
  if current_user.admin?
    # Admin tiene acceso completo
    return true
  elsif current_user.operador? && action_name == "create"
    # Operador solo tiene acceso a la acción "create"
    return true
  else
    # Los demás no tienen acceso
    redirect_to pages_inicio_path, alert: "Acceso denegado."
  end
end

before_action :authorize_user, only: [:create, :new]
  #before_action :set_maintenance, only: %i[ show edit update destroy ]

  # GET /maintenances or /maintenances.json
  def index
    @maintenances = Maintenance.all
    @pagy, @maintenances = pagy(@maintenances)
  end

  # GET /maintenances/1 or /maintenances/1.json
  def show
    @maintenance = Maintenance.find(params[:id])
  end

  # GET /maintenances/new
  def new
    @maintenance = Maintenance.new
    render "new"
  end

  # GET /maintenances/1/edit
  def edit
  end

  # POST /maintenances or /maintenances.json
  def create
    @maintenance = Maintenance.new(maintenance_params)

    # Busca los registros relacionados en las tablas
    engine = Engine.find(params[:maintenance][:engine_id])
    type_maintenance = TypeMaintenance.find(params[:maintenance][:type_maintenance_id])
    town = Town.find(params[:maintenance][:town_id])
    material = Material.find(params[:maintenance][:material_id])


    # Asocia los registros relacionados con la Maintenance
    @maintenance.engine = engine
    @maintenance.type_maintenance = type_maintenance
    @maintenance.town = town
    @maintenance.material = material

    # Asocia el usuario actualmente autenticado
    @maintenance.user = current_user

    respond_to do |format|
      if @maintenance.save
        format.html { redirect_to maintenance_url(@maintenance), notice: "Maintenance was successfully created." }
        format.json { render :show, status: :created, location: @maintenance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenances/1 or /maintenances/1.json
  def update
    respond_to do |format|
      if @maintenance.update(maintenance_params)
        format.html { redirect_to maintenance_url(@maintenance), notice: "Maintenance was successfully updated." }
        format.json { render :show, status: :ok, location: @maintenance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenances/1 or /maintenances/1.json
  def destroy
    @maintenance.destroy

    respond_to do |format|
      format.html { redirect_to maintenances_url, notice: "Maintenance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_params
      params.require(:maintenance).permit(:name_engine, :email, :engine_id, :type_maintenance_id, :town_id, :material_id)
    end
end
