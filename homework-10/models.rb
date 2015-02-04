ActiveRecord::Base.establish_connection(
  YAML::load(File.open("./db/database.yml"))['development']
)

class Genre<ActiveRecord::Base
  has_many :movies
end

class Movie<ActiveRecord::Base
  belongs_to :genre
end
