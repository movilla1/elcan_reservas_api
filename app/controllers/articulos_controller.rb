class ArticulosController < ApplicationController
  before_action :set_articulo, only: [:show, :update, :destroy]

  # GET /articulos
  # GET /articulos.json
  def index
    @articulos = Articulo.all
  end

  # GET /articulos/1
  # GET /articulos/1.json
  def show
  end

  # POST /articulos
  # POST /articulos.json
  def create
    @articulo = Articulo.new(articulo_params)

    if @articulo.save
      render :show, status: :created, location: @articulo
    else
      render json: @articulo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articulos/1
  # PATCH/PUT /articulos/1.json
  def update
    if @articulo.update(articulo_params)
      render :show, status: :ok, location: @articulo
    else
      render json: @articulo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articulos/1
  # DELETE /articulos/1.json
  def destroy
    @articulo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articulo
      @articulo = Articulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articulo_params
      params.require(:articulo).permit(:nombre, :descripcion, :codigo, :precio_compra, :precio_venta, :margen, :descuento, :tipo_descuento, :cantidad, :imagen, :creador_id)
    end
end
