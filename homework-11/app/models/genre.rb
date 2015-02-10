class Genre < ActiveRecord::Base
  has_many :genre_movie_serial, :dependent =>:destroy
end
