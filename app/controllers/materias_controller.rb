
class MateriasController < ApplicationController
  before_action :set_materia, only: [:show, :edit, :update, :destroy]

  # GET /materias
  # GET /materias.json
  def index
      if params[:query]
        @materias = Materia.where("(LOWER(nome) like LOWER(:query))", {query: "%#{params[:query]}%"})
      else
        @materias = Materia.all
      end
  end

  # GET /materias/1
  # GET /materias/1.json
  def show
  end

  # GET /materias/new
  def new
    @materia = Materia.new
  end

  # GET /materias/1/edit
  def edit
  end

  # POST /materias
  # POST /materias.json
  def create
    @materia = Materia.new(materia_params)

    respond_to do |format|
      if @materia.save
        format.html { redirect_to @materia, notice: 'Materia was successfully created.' }
        format.json { render action: 'show', status: :created, location: @materia }
      else
        format.html { render action: 'new' }
        format.json { render json: @materia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materias/1
  # PATCH/PUT /materias/1.json
  def update
    respond_to do |format|
      if @materia.update(materia_params)
        format.html { redirect_to @materia, notice: 'Materia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @materia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materias/1
  # DELETE /materias/1.json
  def destroy
    @materia.destroy
    respond_to do |format|
      format.html { redirect_to materias_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materia
      @materia = Materia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materia_params
      params.require(:materia).permit(:nome, :professor_id)
    end
end
