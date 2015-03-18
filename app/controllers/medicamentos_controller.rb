class MedicamentosController < ApplicationController
  before_action :set_medicamento, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with :name => "trunks", :password => "lestat", only: [:index, :new, :edit]
  # http_basic_authenticate_with :name => "trunks", :password => "trunks"

  # GET /medicamentos
  # GET /medicamentos.json
  def index
    @medicamentos = Medicamento.all
  end

  def busqueda
    @medicamentos = Medicamento.all
  end

  # GET /medicamentos/1
  # GET /medicamentos/1.json
  def show
  end

  # GET /medicamentos/new
  def new
    @medicamento = Medicamento.new
  end

  # GET /medicamentos/1/edit
  def edit
  end

  # POST /medicamentos
  # POST /medicamentos.json
  def create
    @medicamento = Medicamento.new(medicamento_params)

    respond_to do |format|
      if @medicamento.save
        format.html { redirect_to @medicamento, notice: 'Clave creada con exito.' }
        format.json { render :show, status: :created, location: @medicamento }
      else
        format.html { render :new }
        format.json { render json: @medicamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicamentos/1
  # PATCH/PUT /medicamentos/1.json
  def update
    respond_to do |format|
      if @medicamento.update(medicamento_params)
        format.html { redirect_to @medicamento, notice: 'Clave actualizada con exito.' }
        format.json { render :show, status: :ok, location: @medicamento }
      else
        format.html { render :edit }
        format.json { render json: @medicamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicamentos/1
  # DELETE /medicamentos/1.json
  def destroy
    @medicamento.destroy
    respond_to do |format|
      format.html { redirect_to medicamentos_url, notice: 'Clave eliminada con exito.' }
      format.json { head :no_content }
    end
  end

  def buscar_por_clave
   medicamento = Medicamento.where("cast(med_id as text) LIKE ?","#{params[:med_id].to_s.downcase}%")
   #Devuelve un json como salida al navegador.
   render :json => medicamento
 end

  def buscar_por_nombre
   medicamento = Medicamento.where("cast(med_nombre as text) ILIKE ?","%#{params[:med_nombre].to_s.downcase}%")
   #Devuelve un json como salida al navegador.
   render :json => medicamento
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicamento
      @medicamento = Medicamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicamento_params

      params.require(:medicamento).permit(:med_id, :med_nombre, :med_linea)
      
    end
end
