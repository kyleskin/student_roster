json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :last_name, :email, :cell_phone, :home_phone, :work_phone
  json.url student_url(student, format: :json)
end
