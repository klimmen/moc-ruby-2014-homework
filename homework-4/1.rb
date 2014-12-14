
require 'json'

module PersonAdult
  def adult?(*personal_data)
  	personal_data[0]["age"] >= 18
  end
end

module MagicWords

  module ClassMethods
    def magic_methods(pets)
      pets.each do |key, value| 
        define_method("pets_#{key}") do 
          "pens #{key} - #{value}"
        end
      end 
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

end


RESPONSE='{"person":{"personal_data":{"name": "John Smith", "gender":"male", "age":56}, "social_profiles":["http://facebook.com/lala","http://twitter.com/lala","http://lala.ru"], "additional_info":{"hobby":["pubsurfing","drinking","hiking"], "pets":[{"name":"Mittens","species":"Felis silvestris catus"}]}}}'
response = JSON.parse(RESPONSE)

Person = Struct.new(*response["person"].keys.collect(&:to_sym))

Person.class_eval do
  include PersonAdult
  include MagicWords
    def have_hobbies?(additional_info)
  	  result = false
      additional_info.each do |key, value|    	
        if key == "hobby" and !value.empty?
    	  result = true
    	end	
      end
      result 
    end
  magic_methods(response["person"]["additional_info"] ["pets"][0])
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
p person.pets_name
p person.pets_species
