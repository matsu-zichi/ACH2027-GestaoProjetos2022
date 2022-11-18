json.extract! exam, :id, :question_id, :user_id, :score, :hasFinished, :created_at, :updated_at
json.url exam_url(exam, format: :json)
