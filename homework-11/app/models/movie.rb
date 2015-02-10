class Movie < ActiveRecord::Base
  has_many :genre_movie_serial, as: :resource,  :dependent =>:destroy
end
