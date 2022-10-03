json.extract! question, :id, :descricao, :tipo, :dificuldade, :resposta, :created_at, :updated_at
json.url question_url(question, format: :json)
