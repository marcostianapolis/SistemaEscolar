json.array!(@materias) do |materia|
  json.extract! materia, :id, :nome, :professor_id
  json.url materia_url(materia, format: :json)
end
