class CreateProvas < ActiveRecord::Migration
  def change
    create_table :provas do |t|
      t.integer :aluno_id
      t.integer :materia_id
      t.decimal :nota1, :default => "0.0"
      t.decimal :nota2, :default => "0.0"
      t.decimal :nota3, :default => "0.0"
      t.decimal :nota4, :default => "0.0"

      t.timestamps
    end
  end
end
