json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :due_date, :completed, :user_id
  json.url task_url(task, format: :json)
end
