require File.expand_path '../spec_helper.rb', __FILE__

GENRES = ["all", "biografii", "boeviki", "vesterny", "voennye", "detektivy", "detektivy",
    "detskie", "dokumentalnye", "dramy", "istoricheskie", "komedii", "kriminal", "melodramy",
    "multfilmy", "mjuzikly", "otechestvenie", "prikljuchenija", "semejnye", "sportivnye",
    "trillery", "uzhasy", "fantastika", "fjentjezi" ]

LINK = ["Все жанры", "Биографии", "Боевики", "Вестерны", "Военные", "Детективы", "Детские",
        "Документальные","Драмы", "Исторические", "Комедии", "Криминал", "Мелодрамы",
        "Мультфильмы", "Мюзиклы", "Отечественные", "Приключения", "Семейные", "Cпортивные",
        "Триллеры", "Ужасы", "Фантастика", "Фэнтези"]

HTTP_TEST = Nokogiri::HTML(open("http://kinogo.net/")).to_s

describe "Home page" do
  before { get '/' }

  it "should allow accessing the Home page" do
    last_response.should be_ok
  end

end
 
describe "Home page" do
  before { visit '/' } 

  it "should have the content 'Home page'" do
    expect(page).to have_content('Genres:')
  end

  LINK.each do |link|
    it "should have the link '#{link}'" do
      expect(page).to have_content('Genres:')
  	  click link
    end
  end

end

describe "Genre page" do

  GENRES.each do |genre|
    #before { get "/kinogo/#{genre}" }
   	
    it "should allow accessing the /kinogo/#{genre} page" do
      get "/kinogo/#{genre}"	
      last_response.should be_ok
    end

    it "should have the content /kinogo/#{genre} " do
      get "/kinogo/#{genre}"
      expect(last_response.body).to match("CONTENT OF THE SITE TODAY")
    end

  end
end

describe "Genre page" do
  
  it "extracts the contents of the kinogo.net " do
    expect(HTTP_TEST).to match("DOCTYPE html")
    expect(HTTP_TEST).to match("<title>")
    expect(HTTP_TEST).to match('class="zagolovki"')   
    expect(HTTP_TEST).to match('class="dateicon"')
  end

end






