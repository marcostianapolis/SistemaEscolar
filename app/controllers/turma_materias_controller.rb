class TurmaMateriasController < ApplicationController
  before_action :set_turma_materia, only: [:show, :edit, :update, :destroy]

  # GET /turma_materias
  # GET /turma_materias.json
  def index
    if params[:form]
      @turma_materias = TurmaMateria.where("turma_id = :query", {query: params[:form][:turma_id]})
    else
      @turma_materias = TurmaMateria.all
    end
  end

  # GET /turma_materias/1
  # GET /turma_materias/1.json
  def show
  end

  # GET /turma_materias/new
  def new
    @turma_materia = TurmaMateria.new
  end

  # GET /turma_materias/1/edit
  def edit
  end

  # POST /turma_materias
  # POST /turma_materias.json
  def create
    @turma_materia = TurmaMateria.new(turma_materia_params)

    respond_to do |format|
      if @turma_materia.save
        format.html { redirect_to @turma_materia, notice: 'Turma materia was successfully created.' }
        format.json { render action: 'show', status: :created, location: @turma_materia }
      else
        format.html { render action: 'new' }
        format.json { render json: @turma_materia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turma_materias/1
  # PATCH/PUT /turma_materias/1.json
  def update
    respond_to do |format|
      if @turma_materia.update(turma_materia_params)
        format.html { redirect_to @turma_materia, notice: 'Turma materia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @turma_materia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turma_materias/1
  # DELETE /turma_materias/1.json
  def destroy
    @turma_materia.destroy
    respond_to do |format|
      format.html { redirect_to turma_materias_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turma_materia
      @turma_materia = TurmaMateria.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def turma_materia_params
      params.require(:turma_materia).permit(:turma_id, :materia_id)
    end
end
