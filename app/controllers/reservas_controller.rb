class ReservasController < ApplicationController
  before_action :set_reserva, only: [:show, :update, :destroy]

  # GET /reservas
  # GET /reservas.json
  def index
    @reservas = Reserva.all
  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show
  end

  # POST /reservas
  # POST /reservas.json
  def create
    @reserva = Reserva.new(reserva_params)

    if @reserva.save
      render :show, status: :created, location: @reserva
    else
      render json: @reserva.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservas/1
  # PATCH/PUT /reservas/1.json
  def update
    if @reserva.update(reserva_params)
      render :show, status: :ok, location: @reserva
    else
      render json: @reserva.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
    @reserva.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserva_params
      params.require(:reserva).permit(:adelanto, :fecha_inicio, :fecha_fin, :cliente_id, :creador_id, :cancha_id)
    end
end
