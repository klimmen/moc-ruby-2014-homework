class Snake

  def sleepingSnake (arraySnake)
    puts
    puts "arraySnake"
    arraySnake.each {|item| item.each {|item2| print item2; print ' '}; puts }
  end

  def amountCircle(n)
    if n % 2 == 1
      n+=1
    end
    n= n/2
  end


  def creepSnake (arraySnake, n)
    i=0
    puts 
    puts "result"
    loop do
      arraySnake.each_index do |item| 
        if item == 0
          print arraySnake[item].join " "
          print " "
        elsif item == (arraySnake.length-1)
          print arraySnake[item].reverse.join " "
          arraySnake.delete_at(item)
        else 
          arraySnake[item].reverse!
          print arraySnake[item][0]
          print " "
          arraySnake[item].delete_at(0) 
        end 
      end
      arraySnake.delete_at(0)
      print " "
      arraySnake.reverse.each do |item|
        item.reverse!
        print item[0]
        print " "
        item.delete_at(0)
      end
      i+=1
      break if i==n
    end
  end
end

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


snake = Snake.new
snake.sleepingSnake(array_a)
n = snake.amountCircle(array_a.length)
snake.creepSnake(array_a,n)
puts


