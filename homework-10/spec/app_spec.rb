require File.expand_path '../spec_helper.rb', __FILE__
GENRES = ["all", "biografii", "boeviki", "vesterny", "voennye", "detektivy", "detektivy",
    "detskie", "dokumentalnye", "dramy", "istoricheskie", "komedii", "kriminal", "melodramy",
    "multfilmy", "mjuzikly", "otechestvenie", "prikljuchenija", "semejnye", "sportivnye",
    "trillery", "uzhasy", "fantastika", "fjentjezi" ]

HTTP_TEST = Nokogiri::HTML(open("http://kinogo.net/")).to_s

describe "FactoryGirl" do
  genre = FactoryGirl.create(:genre)
  movie = FactoryGirl.create(:movie)
end

describe "Home page" do

  before { get '/' }

  it "should allow accessing " do
    last_response.should be_ok
  end
  
  it "should have the content " do
    expect(last_response.body).to match('Genres:')
  end

end

GENRES.each do |genre| 
  describe "Home page" do
    before { visit '/' } 

    it "should have the link '#{genre}'" do
      click genre
    end
  
  end

  describe "Genre page" do    
    it "should allow accessing the /kinogo/#{genre} page" do
      get "/kinogo/#{genre}"	
      last_response.should be_ok
    end

    it "should have the content /kinogo/#{genre} " do
      get "/kinogo/#{genre}"
      expect(last_response.body).to match("MOVIES")
    end

  end

end

describe "kinogo.net" do
  
  it "should extracts the contents of the page " do
    expect(HTTP_TEST).to match("DOCTYPE html")
    expect(HTTP_TEST).to match("<title>")
    expect(HTTP_TEST).to match('class="zagolovki"')   
    expect(HTTP_TEST).to match('class="dateicon"')
  end

end






