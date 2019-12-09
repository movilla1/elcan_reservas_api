# frozen_string_literal: true

class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[show update destroy]

  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show; end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      render :show, status: :created, location: @cliente
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    if @cliente.update(cliente_params)
      render :show, status: :ok, location: @cliente
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cliente
    @cliente = Cliente.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { mensaje: "Cliente no válido" }, status: :not_found
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cliente_params
    params.require(:cliente).permit(:nombre, :apellido, :direccion, :email, :telefono, :fecha_nacimiento, :creador_id)
  end
end
