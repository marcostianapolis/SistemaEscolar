class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.integer :turma_id
      t.string :nome

      t.timestamps
    end
  end
end
