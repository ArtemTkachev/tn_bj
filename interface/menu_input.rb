# frozen_string_literal: true

# module MenuInput
module MenuInput
  MENU = { start: "Menu:
       1 Deal
       2 Exit
Select:",
           gamer_move: "Menu:
       1 Hit
       2 Stand
       3 Open
Select:" }.freeze
  MENU_ACTIONS = { start: %i[create_game
                             exit],
                   gamer_turn: %i[hit
                                  stand
                                  open] }.freeze

  def menu(action)
    system('clear')
    output_table(table)
    print MENU[action]
    answer = MENU_ACTIONS[action][gets.chomp.to_i - 1]
    return if answer.nil? || answer == :exit

    send(answer)
  end
end
