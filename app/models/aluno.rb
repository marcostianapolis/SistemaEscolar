class Aluno < ActiveRecord::Base
  # Aluno -> Turma_materia
  belongs_to :turma_materia, foreign_key: :turma_id

  # Aluno -> Turma
  belongs_to :turma

  # Apagando alunos apaga provas.
  has_many :provas, dependent: :delete_all
  accepts_nested_attributes_for :provas, :allow_destroy => true

  # nome e turma de aluno são campos obrigatórios
  validates_presence_of :nome, :turma_id

  # associando [prova] a [aluno]
  validates :nome, uniqueness: { scope: :turma_id, message: " já está matriculado nesta turma!" }
end
