class Movie < ActiveRecord::Base
  has_many :genre_movie_serial, as: :resource,  :dependent =>:destroy

#scope :genres, ->(id) { find(id).genre_movie_serial.all }

  def self.genres
    Genre.all
  end
end
