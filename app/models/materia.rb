class Materia < ActiveRecord::Base
  # materia -> professor
  belongs_to :professor

  # turmas_materias -> materia
  has_many :turma_materias

  # provas -> materia
  has_many :provas

  # nome é campo obrigatório
  validates_presence_of :nome
end
