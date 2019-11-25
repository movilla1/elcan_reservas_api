class ArticulosCompraController < ApplicationController
  before_action :set_articulo_compra, only: [:show, :update, :destroy]

  # GET /articulos_compra
  # GET /articulos_compra.json
  def index
    @articulos_compra = ArticuloCompra.all
  end

  # GET /articulos_compra/1
  # GET /articulos_compra/1.json
  def show
  end

  # POST /articulos_compra
  # POST /articulos_compra.json
  def create
    @articulo_compra = ArticuloCompra.new(articulo_compra_params)

    if @articulo_compra.save
      render :show, status: :created, location: @articulo_compra
    else
      render json: @articulo_compra.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articulos_compra/1
  # PATCH/PUT /articulos_compra/1.json
  def update
    if @articulo_compra.update(articulo_compra_params)
      render :show, status: :ok, location: @articulo_compra
    else
      render json: @articulo_compra.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articulos_compra/1
  # DELETE /articulos_compra/1.json
  def destroy
    @articulo_compra.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articulo_compra
      @articulo_compra = ArticuloCompra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articulo_compra_params
      params.require(:articulo_compra).permit(:articulo_id, :creador_id, :orden_de_compra_id, :precio_anterior, :cantidad, :status)
    end
end
