class CreateGenreMovieSerials < ActiveRecord::Migration
  def change
    create_table :genre_movie_serials do |t|
      t.integer :genre_id
      t.integer :resource_id
      t.string :resource_type

      t.timestamps null: false
    end
  end
end
