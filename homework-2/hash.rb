hash_a = {anton: 28, denis: 32, kostya: 15, roma: 19, vova: 36, natasha: 21, sveta: 36, alena: 25, lena: 27}
puts "=================================="
puts "Age > 30"
hash_a.each {|key, value| if value > 30; then  puts "#{key} - #{value}" ; end}  
puts "=================================="
puts "odd age"
hash_a.each {|key, value| if value % 2 == 1  ; then  puts "#{key} - #{value}" ; end}
puts "=================================="

