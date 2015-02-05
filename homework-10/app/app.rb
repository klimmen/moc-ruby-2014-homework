
get '/' do
  erb :index
end
 
get '/kinogo/:name' do
   genres = ["all", "biografii", "boeviki", "vesterny", "voennye", "detektivy", "detektivy",
    "detskie", "dokumentalnye", "dramy", "istoricheskie", "komedii", "kriminal", "melodramy",
    "multfilmy", "mjuzikly", "otechestvenie", "prikljuchenija", "semejnye", "sportivnye",
    "trillery", "uzhasy", "fantastika", "fjentjezi" ]

   unless genres.include?(params[:name])
     status 404
     "<h2> Genre with such name not exist</h2>"     
   else
     params[:name]="" if params[:name]=="all"
     videos = ParsingSite.parsing_kinogo(params[:name])
     erb :kinogo_movies , locals: {videos: videos, ganre: params[:name]}
   end
end

get '/kinogo/:name/save_wovies' do
   genre = Genre.new
   genre.name = params[:name] 
   videos = ParsingSite.parsing_kinogo(params[:name])    
   videos.each do |video|
     movie = Movie.new
     movie.name = video
     genre.movies << movie
   end
   genre.save
   "Save OK"
end

get '/show' do
  genres = Genre.all
  erb :show , locals: {genres: genres}
end

get '/genres/:id' do
  genres = Genre.find(params[:id])
  erb :genres , locals: {genres: genres}
end

 

