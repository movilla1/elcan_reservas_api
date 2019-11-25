class ComprasController < ApplicationController
  before_action :set_compra, only: %i[show update destroy]

  # GET /compras
  # GET /compras.json
  def index
    @compras = Compra.all
  end

  # GET /compras/1
  # GET /compras/1.json
  def show
  end

  # POST /compras
  # POST /compras.json
  def create
    @compra = Compra.new(compra_params)

    if @compra.save
      render :show, status: :created, location: @compra
    else
      render json: @compra.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /compras/1
  # PATCH/PUT /compras/1.json
  def update
    if @compra.update(compra_params)
      render :show, status: :ok, location: @compra
    else
      render json: @compra.errors, status: :unprocessable_entity
    end
  end

  # DELETE /compras/1
  # DELETE /compras/1.json
  def destroy
    @compra.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_compra
    @compra = Compra.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def compra_params
    params
      .require(:compra)
      .permit(
        :status,
        :cantidad,
        :precio_unitario,
        :precio_total,
        :creador_id,
        :articulo_id,
        :proveedor_id,
        :caja_id
      )
  end
end
