class CajasController < ApplicationController
  before_action :set_caja, only: [:show, :update, :destroy]

  # GET /cajas
  # GET /cajas.json
  def index
    @cajas = Caja.all
  end

  # GET /cajas/1
  # GET /cajas/1.json
  def show
  end

  # POST /cajas
  # POST /cajas.json
  def create
    @caja = Caja.new(caja_params)

    if @caja.save
      render :show, status: :created, location: @caja
    else
      render json: @caja.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cajas/1
  # PATCH/PUT /cajas/1.json
  def update
    if @caja.update(caja_params)
      render :show, status: :ok, location: @caja
    else
      render json: @caja.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cajas/1
  # DELETE /cajas/1.json
  def destroy
    @caja.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caja
      @caja = Caja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caja_params
      params.require(:caja).permit(:fecha, :fondo_inicial, :creador_id)
    end
end
