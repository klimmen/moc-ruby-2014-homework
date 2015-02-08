module ApplicationHelper

    def select_option_genres(first_genre)
  	genres = [[first_genre.genre.name, first_genre.genre.id]]
  	Genre.all.map do |c| 
      if [c.name, c.id] != [first_genre.genre.name, first_genre.genre.id]
  	    genres << [c.name, c.id] 
  	  end
  	end 
  	genres
  end
  
end
