class ProveedoresController < ApplicationController
  before_action :set_proveedor, only: [:show, :update, :destroy]

  # GET /Proveedores
  # GET /Proveedores.json
  def index
    @proveedores = Proveedor.all
  end

  # GET /Proveedores/1
  # GET /Proveedores/1.json
  def show
  end

  # POST /Proveedores
  # POST /Proveedores.json
  def create
    @proveedor = Proveedor.new(proveedor_params)

    if @proveedor.save
      render :show, status: :created, location: @proveedor
    else
      render json: @proveedor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /Proveedores/1
  # PATCH/PUT /Proveedores/1.json
  def update
    if @proveedor.update(proveedor_params)
      render :show, status: :ok, location: @proveedor
    else
      render json: @proveedor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /Proveedores/1
  # DELETE /Proveedores/1.json
  def destroy
    @proveedor.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_proveedor
    @proveedor = Proveedor.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { mensaje: "No se encuentra proveedor" }, status: :not_found
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def proveedor_params
    params
      .require(:proveedor)
      .permit(
        :nombre,
        :direccion,
        :telefono,
        :contacto,
        :email,
        :sitio_web,
        :creador_id
      )
  end
end
