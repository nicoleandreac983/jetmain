class TypeMaintenancesController < ApplicationController
  before_action :set_type_maintenance, only: %i[ show edit update destroy ]

  # GET /type_maintenances or /type_maintenances.json
  def index
    @type_maintenances = TypeMaintenance.all
  end

  # GET /type_maintenances/1 or /type_maintenances/1.json
  def show
  end

  # GET /type_maintenances/new
  def new
    @type_maintenance = TypeMaintenance.new
  end

  # GET /type_maintenances/1/edit
  def edit
  end

  # POST /type_maintenances or /type_maintenances.json
  def create
    @type_maintenance = TypeMaintenance.new(type_maintenance_params)

    respond_to do |format|
      if @type_maintenance.save
        format.html { redirect_to type_maintenance_url(@type_maintenance), notice: "Type maintenance was successfully created." }
        format.json { render :show, status: :created, location: @type_maintenance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type_maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_maintenances/1 or /type_maintenances/1.json
  def update
    respond_to do |format|
      if @type_maintenance.update(type_maintenance_params)
        format.html { redirect_to type_maintenance_url(@type_maintenance), notice: "Type maintenance was successfully updated." }
        format.json { render :show, status: :ok, location: @type_maintenance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type_maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_maintenances/1 or /type_maintenances/1.json
  def destroy
    @type_maintenance.destroy

    respond_to do |format|
      format.html { redirect_to type_maintenances_url, notice: "Type maintenance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_maintenance
      @type_maintenance = TypeMaintenance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_maintenance_params
      params.require(:type_maintenance).permit(:name, :maintenance_id)
    end
end
