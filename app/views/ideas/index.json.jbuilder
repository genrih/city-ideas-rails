json.array!(@ideas) do |idea|
  json.extract! idea, :id, :user_id, :title, :description
  json.url idea_url(idea, format: :json)
end
