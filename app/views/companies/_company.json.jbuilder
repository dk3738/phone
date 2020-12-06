json.extract! company, :id, :user_id, :title, :description, :view, :created_at, :updated_at
json.url company_url(company, format: :json)
