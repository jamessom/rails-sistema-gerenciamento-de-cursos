json.extract! student, :id, :cpf, :email, :phone, :date_birth, :created_at, :updated_at
json.url student_url(student, format: :json)
