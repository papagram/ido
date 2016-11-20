json.extract! task, :id, :subject, :body, :status, :start_at, :closing_at, :created_at, :updated_at
json.url task_url(task, format: :json)