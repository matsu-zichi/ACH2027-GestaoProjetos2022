json.extract! exam, :id, :name, :description, :num_questions, :exam_date, :exam_time, :ambiente_id, :created_at, :updated_at
json.url exam_url(exam, format: :json)
