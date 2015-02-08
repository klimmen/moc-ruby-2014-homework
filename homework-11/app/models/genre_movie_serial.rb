class GenreMovieSerial < ActiveRecord::Base
  belongs_to :resource, polymorphic: true
  belongs_to :genre
end
