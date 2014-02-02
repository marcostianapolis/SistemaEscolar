class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]
  before_action :set_turmas, only: [:new, :edit, :update, :create]

  # GET /alunos
  # GET /alunos.json
  def index
    if params[:query]
      @alunos = Aluno.where("(LOWER(nome) like LOWER(:query))", {query: "%#{params[:query]}%"})
    else
      @alunos = Aluno.all
    end
  end

  # GET /alunos/1
  # GET /alunos/1.json
  def show
  end

  # GET /alunos/new
  def new
    set_turmas
    @aluno = Aluno.new
  end

  # GET /alunos/1/edit
  def edit
    set_turmas
  end

  # POST /alunos
  # POST /alunos.json
  def create

    @aluno = Aluno.new(aluno_params)

    respond_to do |format|
      if @aluno.save
        format.html { redirect_to @aluno, notice: 'Aluno criado com sucesso!' }
        format.json { render action: 'show', status: :created, location: @aluno }
      else
        set_turmas
        format.html { render action: 'new' }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alunos/1
  # PATCH/PUT /alunos/1.json
  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to @aluno, notice: 'Aluno was successfully updated.' }
        format.json { head :no_content }
      else
        set_turmas
        format.html { render action: 'edit' }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alunos/1
  # DELETE /alunos/1.json
  def destroy
    @aluno.destroy
    respond_to do |format|
      format.html { redirect_to alunos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    # faz a busca para o select passando apenas as turmas que tem mais de 5 materias cadastradas
    def set_turmas
      @turmas = Turma.joins(:turma_materias).having("count(turma_materias.turma_id) > 4").group("turmas.id")
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def aluno_params
      params.require(:aluno).permit(:turma_id, :nome)
    end
end
