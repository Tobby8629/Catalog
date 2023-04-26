require './classes/display_items'

def main
  choice = DisplayItems.new
  choice.retrieve_data
  puts '--------------------------------------------'
  puts '       WELOCME TO THE CATOLOG APP!'
  puts '--------------------------------------------'

  loop do
    choice.choose_option
    puts ''
    print 'Enter choice: '
    input = gets.chomp.to_i

    if input.zero?
      puts 'Thanks for using the app, bye!'
      break
    end

    choice.do_action(input)
  end
end

main
