class OrdenesDeCompraController < ApplicationController
  before_action :set_ordene_de_compra, only: [:show, :update, :destroy]

  # GET /ordenes_de_compra
  # GET /ordenes_de_compra.json
  def index
    @ordenes_de_compra = OrdenDeCompra.all
  end

  # GET /ordenes_de_compra/1
  # GET /ordenes_de_compra/1.json
  def show
  end

  # POST /ordenes_de_compra
  # POST /ordenes_de_compra.json
  def create
    @ordene_de_compra = OrdenDeCompra.new(ordene_de_compra_params)

    if @ordene_de_compra.save
      render :show, status: :created, location: @ordene_de_compra
    else
      render json: @ordene_de_compra.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ordenes_de_compra/1
  # PATCH/PUT /ordenes_de_compra/1.json
  def update
    if @ordene_de_compra.update(ordene_de_compra_params)
      render :show, status: :ok, location: @ordene_de_compra
    else
      render json: @ordene_de_compra.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ordenes_de_compra/1
  # DELETE /ordenes_de_compra/1.json
  def destroy
    @ordene_de_compra.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordene_de_compra
      @ordene_de_compra = OrdenDeCompra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordene_de_compra_params
      params.require(:ordene_de_compra).permit(:creador_id, :nota, :status)
    end
end
