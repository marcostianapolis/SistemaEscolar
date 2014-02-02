class CreateMaterias < ActiveRecord::Migration
  def change
    create_table :materias do |t|
      t.string :nome
      t.integer :professor_id

      t.timestamps
    end
  end
end
