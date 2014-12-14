
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



require 'json'
RESPONSE='{"person":{"personal_data":{"name": "John Smith", "gender":"male", "age":56}, "social_profiles":["http://facebook","http://twitter","http://"], "additional_info":{"hobby":["pubsurfing","drinking","hiking"], "pets":[{"name":"Mittens","species":"Felis silvestris catus"}]}}}'
response = JSON.parse(RESPONSE)
Person = Struct.new(*response["person"].keys.collect(&:to_sym))
Person.class_eval do
  include PersonAdult

end
person = Person.new(*response["person"].values)

 
p person.adult?(person.personal_data)



#RESPONSE='{"person":{"personal_data":{"name": "John Smith", "gender":"male", "age":56},
# "social_profiles":["http://facebook","http://twitter","http://"],
# "additional_info":{"hobby":["pubsurfing","drinking","hiking"],
#  "pets":[{"name":"Mittens","species":"Felis silvestris catus"}]}}}'
#RESPONSE='{"person":{"personal_data":{"name": "John Smith", "gender":"male", "age":56}, "social_profiles":["http://facebook","http://twitter","http://"], "additional_info":{"hobby":["pubsurfing","drinking","hiking"], "pets":[{"name":"Mittens","species":"Felis silvestris catus"}]}}}'
