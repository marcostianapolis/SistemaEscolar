class Professor < ActiveRecord::Base

  # professor -> materia
  has_many :materias

  # nome é campo obrigatório
  validates_presence_of :nome
end
