
require 'json'

module PersonAdult
  def adult?(*personal_data)
    personal_data.each do |data|
      if data["age"] >= 18
      return true
      else
      return false
      end	
    end
  end
end



RESPONSE='{"person":{"personal_data":{"name": "John Smith", "gender":"male", "age":56}, "social_profiles":["http://facebook.com/lala","http://twitter.com/lala","http://lala.ru"], "additional_info":{"hobby":["pubsurfing","drinking","hiking"], "pets":[{"name":"Mittens","species":"Felis silvestris catus"}]}}}'
response = JSON.parse(RESPONSE)

Person = Struct.new(*response["person"].keys.collect(&:to_sym))
Person.class_eval do
  include PersonAdult
    def have_hobbies?(additional_info)
  	result = false
    additional_info.each do |key, value|    	
    	if key == "hobby" and !value.empty?
    		result = true
    	end	
    end
    result 
  end
end

person = Person.new(*response["person"].values)

person.instance_eval do
  def twitter_account?
  	result = false
    social_profiles.each do |social_profile|     
     if !social_profile.downcase.scan(/twitter/).empty?
     	 result = true
     end
    end
    result
  end
end
p "adult?" 
p person.adult?(person.personal_data)
p "twitter_account?"
p person.twitter_account?
p "have_hobbies?"
p person.have_hobbies?(person.additional_info)
