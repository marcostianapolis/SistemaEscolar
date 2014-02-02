class Turma < ActiveRecord::Base

  # turma_materia -> turma, não aceita ser apagado se existir turma_materia
  has_many :turma_materias, dependent: :restrict_with_error

  # alunos -> turma
  has_many :alunos

  # nome é campo obrigatório
  validates_presence_of :nome

  # valida a exista um único campo nome
  validates_uniqueness_of :nome
end
