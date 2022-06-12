# frozen_string_literal: true

# module Menu
module Menu
  MENU_START = "\nMenu:
      1 Create game
      2 Exit
  Select:"
  MENU_ACTIONS_START = %i[
    create_station
    exit
  ].freeze

  def show_menu
    loop do
      print MENU_STR
      answer = MENU_ACTIONS_START[gets.chomp.to_i - 1]
      break if answer == :exit

      send(answer)
    end
  end
end
