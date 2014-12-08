#  1  2  3  4 5 
# 16 17 18 19 6
# 15 24 25 20 7
# 14 23 22 21 8
# 13 12 11 10 9
#array_a = [[1]]
#array_a = [[1,2],[4,3]]
#array_a = [[1,2,3],[8,9,4],[7,6,5]]
#array_a = [[1,2,3,4],[12,13,14,5],[11,16,15,6],[10,9,8,7]]
array_a = [[1,2,3,4,5],[16,17,18,19,6],[15,24,25,20,7],[14,23,22,21,8],[13,12,11,10,9]]

puts
puts "array_a"
array_a.each {|item| item.each {|item2| print item2; print ' '}; puts }
n = array_a.length
if n % 2 == 1
  n+=1
end
n= n/2
i=0
puts 
puts "result"
loop do
  array_a.each_index do |item| 
    if item == 0
      print array_a[item].join " "
      print " "
    elsif item == (array_a.length-1)
      print array_a[item].reverse.join " "
      array_a.delete_at(item)
    else 
      array_a[item].reverse!
      print array_a[item][0]
      print " "
      array_a[item].delete_at(0) 
    end 
  end
  array_a.delete_at(0)
  print " "
  array_a.reverse.each do |item|
    item.reverse!
    print item[0]
    print " "
    item.delete_at(0)
  end
  i+=1
  break if i==n
end
puts
puts



