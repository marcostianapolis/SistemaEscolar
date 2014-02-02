json.array!(@turmas) do |turma|
  json.extract! turma, :id, :nome
  json.url turma_url(turma, format: :json)
end
