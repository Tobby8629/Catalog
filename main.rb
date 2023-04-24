require './classes/display_items'

def main
  choice = Display_items.new

  loop do
    choice.choose_option
    input = gets.chomp.to_i

    if input == 10
      puts "Thanks for using the app, bye!"
      break
    end

    choice.do_action(input)
  end
end

main