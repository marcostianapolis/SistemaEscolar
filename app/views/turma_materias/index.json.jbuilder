json.array!(@turma_materias) do |turma_materia|
  json.extract! turma_materia, :id, :turma_id, :materia_id
  json.url turma_materia_url(turma_materia, format: :json)
end
