# frozen_string_literal: true

# module MenuInput
module MenuInput
  MENU = { start: "\nMenu:
    1 Deal
    2 Exit
Select:" }.freeze
  MENU_ACTIONS = { start: %i[create_game
                             exit] }.freeze

  def menu(action)
    loop do
      print MENU[action]
      answer = MENU_ACTIONS[action][gets.chomp.to_i - 1]
      break if answer == :exit

      send(answer)
    end
  end
end
