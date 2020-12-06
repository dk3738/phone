json.extract! review, :id, :user_id, :title, :image, :description, :view_count, :created_at, :updated_at
json.url review_url(review, format: :json)
