json.extract! course, :id, :name, :requiriment, :workload, :price, :created_at, :updated_at
json.url course_url(course, format: :json)
