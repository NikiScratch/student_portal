json.array!(@subjects) do |subject|
  json.extract! subject, :id, :name, :schedule_id, :teacher_id
  json.url subject_url(subject, format: :json)
end
