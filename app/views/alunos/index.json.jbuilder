json.array!(@alunos) do |aluno|
  json.extract! aluno, :id, :turma_id, :nome
  json.url aluno_url(aluno, format: :json)
end
