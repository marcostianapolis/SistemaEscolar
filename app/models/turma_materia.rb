class TurmaMateria < ActiveRecord::Base
  belongs_to :turma
  belongs_to :materia
  has_many :alunos

  # turma_id e materia_id são campos obrigatórios
  validates_presence_of :turma_id, :materia_id, message: "Campos em branco!"

  # associando [prova] a [aluno]
  validates :turma_id, uniqueness: { scope: :materia_id, message: " já contém esta matéria!" }
end
