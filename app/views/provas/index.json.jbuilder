json.array!(@provas) do |prova|
  json.extract! prova, :id, :aluno_id, :materia_id, :nota1, :nota2, :nota3, :nota4
  json.url prova_url(prova, format: :json)
end
