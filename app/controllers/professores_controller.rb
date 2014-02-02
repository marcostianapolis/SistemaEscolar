class ProfessoresController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]

  # GET /professores
  # GET /professores.json
  def index
    if params[:query]
      @professores = Professor.where("(LOWER(nome) like LOWER(:query))", {query: "%#{params[:query]}%"})
    else
      @professores = Professor.all
    end
  end

  # GET /professores/1
  # GET /professores/1.json
  def show
  end

  # GET /professores/new
  def new
    @professor = Professor.new
  end

  # GET /professores/1/edit
  def edit
  end

  # POST /professores
  # POST /professores.json
  def create
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'Professor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @professor }
      else
        format.html { render action: 'new' }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professores/1
  # PATCH/PUT /professores/1.json
  def update
    respond_to do |format|
      if @professor.update(professor_params)
        format.html { redirect_to @professor, notice: 'Professor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professores/1
  # DELETE /professores/1.json
  def destroy
    @professor.destroy
    respond_to do |format|
      format.html { redirect_to professores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:nome)
    end
end
