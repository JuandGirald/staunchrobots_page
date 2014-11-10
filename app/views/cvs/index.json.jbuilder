json.array!(@cvs) do |cv|
  json.extract! cv, :id, :name, :profile, :title, :stackoverflow_reputation, :blog
  json.url cv_url(cv, format: :json)
end
