
get '/' do
  "<h2> CONTENT OF THE SITE TODAY </h2>
   <h4> Genres: </h4>
   <a id='all' href='/kinogo/all'>Все жанры</a> <br>
   <a id='biografii' href='/kinogo/biografii'>Биографии</a>  <br> 
   <a id='boeviki' href='/kinogo/boeviki'>Боевики </a> <br>
   <a id='vesterny' href='/kinogo/vesterny'>Вестерны </a> <br>
   <a id='voennye' href='/kinogo/voennye'>Военные</a> <br>
   <a id='detektivy' href='/kinogo/detektivy'>Детективы</a> <br> 
   <a id='detskie' href='/kinogo/detskie'>Детские</a> <br>  
   <a id='dokumentalnye' href='/kinogo/dokumentalnye'>Документальные</a> <br>   
   <a id='dramy' href='/kinogo/dramy'>Драмы</a> <br> 
   <a id='istoricheskie' href='/kinogo/istoricheskie'>Исторические </a> <br> 
   <a id='komedii' href='/kinogo/komedii'>Комедии </a> <br>
   <a id='kriminal' href='/kinogo/kriminal'>Криминал </a> <br>
   <a id='melodramy' href='/kinogo/melodramy'> Мелодрамы </a> <br>
   <a id='multfilmy' href='/kinogo/multfilmy'>Мультфильмы</a> <br> 
   <a id='mjuzikly' href='/kinogo/mjuzikly'>Мюзиклы</a> <br>
   <a id='otechestvenie' href='/kinogo/otechestvenie'>Отечественные</a> <br>
   <a id='prikljuchenija' href='/kinogo/prikljuchenija'>Приключения</a> <br>
   <a id='semejnye' href='/kinogo/semejnye'>Семейные</a> <br>
   <a id='sportivnye' href='/kinogo/sportivnye'>Cпортивные</a> <br> 
   <a id='trillery' href='/kinogo/trillery'>Триллеры</a> <br> 
   <a id='uzhasy' href='/kinogo/uzhasy'>Ужасы</a> <br> 
   <a id='fantastika' href='/kinogo/fantastika'>Фантастика </a> <br>
   <a id='fjentjezi' href='/kinogo/fjentjezi'>Фэнтези</a> <br>" 

end
 
get '/kinogo/:name' do
   genres = ["all", "biografii", "boeviki", "vesterny", "voennye", "detektivy", "detektivy",
    "detskie", "dokumentalnye", "dramy", "istoricheskie", "komedii", "kriminal", "melodramy",
    "multfilmy", "mjuzikly", "otechestvenie", "prikljuchenija", "semejnye", "sportivnye",
    "trillery", "uzhasy", "fantastika", "fjentjezi" ]

   unless genres.include?(params[:name])
     status 404
     "<h2> this is no such genre </h2>"     
   else
     params[:name]="" if params[:name]=="all"
     videos = ParsingSite.parsing_kinogo(params[:name]) 
     videos[1] ||= "<h2>There are not  films in this genre</h2>"
     videos.unshift("<h2> CONTENT OF THE SITE TODAY </h2> ")
   end
end



 

