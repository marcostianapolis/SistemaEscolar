class Prova < ActiveRecord::Base

  # prova -> aluno
  belongs_to :aluno #, foreign_key: :aluno_id

  # prova -> materia
  belongs_to :materia

  # define a média se maior que 6.0 aluno aprovado
  # verifica se todas as notas estão preenchidas
  def resultado
    return "Notas pendentes" if (self.nota1==0.0) or (self.nota2==0.0) or (self.nota3==0.0) or (nota4==0.0)
    return "Aprovado" if (self.nota1+self.nota2+self.nota3+self.nota4)/4 >6.0 else "Reprovado"
  end

  def cor_resultado
    return "label label-info" if (self.nota1==0.0) or (self.nota2==0.0) or (self.nota3==0.0) or (nota4==0.0)
    return "label label-success" if (self.nota1+self.nota2+self.nota3+self.nota4)/4 >6.0 else "label label-important"
  end


  # nota1, nota2, nota3, nota4, aluno_id e materia_id são campos obrigatórios
  validates_presence_of :nota1, :nota2, :nota3, :nota4, :aluno_id, :materia_id, message: "Campo em branco"

  #verifica campos numericos
  validates_numericality_of :nota1, :nota2, :nota3, :nota4, message: "Apenas números"

  # Verifica se aluno já existe para matéria
  validates :aluno_id, uniqueness: { scope: :materia_id, message: " e matéria já consta" }

  # chama o atributo nota_certa
  validate :nota_certa

  # nota de 0 a 10
  def nota_certa
    errors.add(:nota1, ' :Digite uma nota válida de 0 a 10') if nota1 > 10  or nota1 < 0
    errors.add(:nota2, ' :Digite uma nota válida de 0 a 10') if nota2 > 10  or nota2 < 0
    errors.add(:nota3, ' :Digite uma nota válida de 0 a 10') if nota3 > 10  or nota3 < 0
    errors.add(:nota4, ' :Digite uma nota válida de 0 a 10') if nota4 > 10  or nota4 < 0
  end
end
