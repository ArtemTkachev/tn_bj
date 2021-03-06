# frozen_string_literal: true

# module MenuInput
module MenuInput
  MENU = { start: "\
       1 Deal
       2 Exit",
           gamer_turn: "\
       1 Hit
       2 Stand
       3 Open",
           gamer_turn_again: "\
       1 Stand
       2 Open" }.freeze
  MENU_ACTIONS = { start: %i[create_game
                             exit],
                   gamer_turn: %i[hit_action
                                  stand_action
                                  open_action],
                   gamer_turn_again: %i[stand_action
                                        open_action] }.freeze

  def menu
    loop do
      general_output
      answer = MENU_ACTIONS[table.status][gets.chomp.to_i - 1]
      break if answer.nil? || answer == :exit

      send(answer)
      cards_number_more(2)
    end
  end

  def general_output
    system('clear')
    output_table
    puts "#{info}\n\n" unless info == ''
    puts 'Menu:'
    puts MENU[table.status]
    print 'Select:'
  end
end
