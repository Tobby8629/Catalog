
class Display_items
  puts "Welcome to our catalog app:" 
  puts "1 Option 1" 
  puts "2 Option 2" 
  puts "3 Option 3" 
  puts "4 Quit" 
  
  print "Enter your choice:"
  choice = gets.chomp.to_i
  
  case choice
  
  when 1
    option_1
  when 2
    option_2
  when 3
    option_3
  when 4
   exit
  else
    puts "Invalid choice"
  end

  def option_1
    #option 1
    puts "Hello"

  end
  def option_2
    #option 2
  end
  def option_3
    #option 3
  end
end