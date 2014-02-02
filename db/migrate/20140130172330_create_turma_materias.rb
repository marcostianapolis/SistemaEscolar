class CreateTurmaMaterias < ActiveRecord::Migration
  def change
    create_table :turma_materias do |t|
      t.integer :turma_id
      t.integer :materia_id

      t.timestamps
    end
  end
end
