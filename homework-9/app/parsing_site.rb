class ParsingSite
  def self.parsing_kinogo(genre)
    page = 1 
    stop = true 
    result = []
    while stop
      url = "http://kinogo.net/#{genre}/page/#{page}/"
      doc = Nokogiri::HTML(open(url))
      name_video = []
      date = []
      result[0] ||= " <h3> #{doc.at_css("title").text} </h3>"
      doc.css('.zagolovki a').each { |x| name_video << x.text }
      doc.css('.dateicon').each { |x| date << x.text }      
      count = 0
      date.each_index do |i|
        if date[i][/Сегодня/].nil?
          stop = false                  
        else  	      
          result << "<p> #{count +=1} - #{name_video[i]} </p>"  
        end
      end
      page+=1            
    end
    result
  end
end

