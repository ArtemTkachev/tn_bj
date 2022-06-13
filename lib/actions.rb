# frozen_string_literal: true

require_relative '../interface/menu_output'
require_relative '../interface/menu_input'
require_relative '../models/table'
require_relative '../models/dealer'
require_relative '../models/gamer'
require_relative '../models/account'
require_relative '../models/deck'

# class Actions
class Actions
  include MenuOutput
  include MenuInput

  attr_reader :table

  def initialize
    @table = Table.new(Dealer.new(Account.new(100)),
                       Gamer.new(Account.new(100)),
                       Deck.new)
  end

  def create_game
    table.start_card_hit
    table.place_bet(10)
    menu(:gamer_turn)
  end

  def stand

  end

  def hit
    table.gamer.hit_card(table.deck.card)
    output_table(table)
  end
end
