json.extract! dog, :id, :name, :sex, :breed, :current_weight, :birthdate, :age, :created_at, :updated_at
json.url dog_url(dog, format: :json)
