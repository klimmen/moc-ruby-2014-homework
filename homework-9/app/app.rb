
get '/' do
  "<h2> CONTENT OF THE SITE TODAY </h2>
   <h4> Genres: </h4>
   <a href='/kinogo/all'>Все жанры</a> <br>
   <a href='/kinogo/biografii'>Биографии</a>  <br> 
   <a href='/kinogo/boeviki'>Боевики </a> <br>
   <a href='/kinogo/vesterny'>Вестерны </a> <br>
   <a href='/kinogo/voennye'>Военные</a> <br>
   <a href='/kinogo/detektivy'>Детективы</a> <br> 
   <a href='/kinogo/detskie'>Детские</a> <br>  
   <a href='/kinogo/dokumentalnye'>Документальные</a> <br>   
   <a href='/kinogo/dramy'>Драмы</a> <br> 
   <a href='/kinogo/istoricheskie'>Исторические </a> <br> 
   <a href='/kinogo/komedii'>Комедии </a> <br>
   <a href='/kinogo/kriminal'>Криминал </a> <br>
   <a href='/kinogo/melodramy'> Мелодрамы </a> <br>
   <a href='/kinogo/multfilmy'>Мультфильмы</a> <br> 
   <a href='/kinogo/mjuzikly'>Мюзиклы</a> <br>
   <a href='/kinogo/otechestvenie'>Отечественные</a> <br>
   <a href='/kinogo/prikljuchenija'>Приключения</a> <br>
   <a href='/kinogo/semejnye'>Семейные</a> <br>
   <a href='/kinogo/sportivnye'>Cпортивные</a> <br> 
   <a href='/kinogo/trillery'>Триллеры</a> <br> 
   <a href='/kinogo/uzhasy'>Ужасы</a> <br> 
   <a href='/kinogo/fantastika'>Фантастика </a> <br>
   <a href='/kinogo/fjentjezi'>Фэнтези</a> <br>" 

end
 
get '/kinogo/:name' do
   genres = ["all", "biografii", "boeviki", "vesterny", "voennye", "detektivy", "detektivy",
    "detskie", "dokumentalnye", "dramy", "istoricheskie", "komedii", "kriminal", "melodramy",
    "multfilmy", "mjuzikly", "otechestvenie", "prikljuchenija", "semejnye", "sportivnye",
    "trillery", "uzhasy", "fantastika", "fjentjezi" ]

   unless genres.include?(params[:name])
     status 404
     "<h2> there is no such genre </h2>"     
   else
   	 if params[:name] == "all" 
       params[:name] = ""
     end
     videos = ParsingSite.parsing_kinogo(params[:name]) 
     videos[1] ||= "<h2>There is no content in this genre </h2>"
     videos.unshift("<h2> CONTENT OF THE SITE TODAY </h2> ")
   end
end



 

