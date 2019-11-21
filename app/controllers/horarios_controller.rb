class HorariosController < ApplicationController
  before_action :set_horario, only: [:show, :update, :destroy]

  # GET /horarios
  # GET /horarios.json
  def index
    @horarios = Horario.all
  end

  # GET /horarios/1
  # GET /horarios/1.json
  def show
  end

  # POST /horarios
  # POST /horarios.json
  def create
    @horario = Horario.new(horario_params)

    if @horario.save
      render :show, status: :created, location: @horario
    else
      render json: @horario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /horarios/1
  # PATCH/PUT /horarios/1.json
  def update
    if @horario.update(horario_params)
      render :show, status: :ok, location: @horario
    else
      render json: @horario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /horarios/1
  # DELETE /horarios/1.json
  def destroy
    @horario.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horario
      @horario = Horario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horario_params
      params.require(:horario).permit(:nombre, :fecha, :hora_inicio, :hora_fin, :created_by_id)
    end
end
