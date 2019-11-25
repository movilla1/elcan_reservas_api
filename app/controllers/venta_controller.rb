class VentaController < ApplicationController
  before_action :set_venta, only: [:show, :update, :destroy]

  # GET /venta
  # GET /venta.json
  def index
    @venta = Venta.all
  end

  # GET /venta/1
  # GET /venta/1.json
  def show
  end

  # POST /venta
  # POST /venta.json
  def create
    @venta = Venta.new(venta_params)

    if @venta.save
      render :show, status: :created, location: @venta
    else
      render json: @venta.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /venta/1
  # PATCH/PUT /venta/1.json
  def update
    if @venta.update(venta_params)
      render :show, status: :ok, location: @venta
    else
      render json: @venta.errors, status: :unprocessable_entity
    end
  end

  # DELETE /venta/1
  # DELETE /venta/1.json
  def destroy
    @venta.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venta
      @venta = Venta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venta_params
      params.require(:venta).permit(:total, :nota)
    end
end
