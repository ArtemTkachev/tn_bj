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
    table.double_card_hit
    table.place_bet(10)
    table.gamer.shadow_cards = false
    table.status = :gamer_turn
    menu
  end

  def open_action
    table.dealer.shadow_cards = false
    counting_results
  end

  def stand_action
    dealer_turn
  end

  def hit_action
    table.gamer.hit_card(table.deck.card)
    dealer_turn if table.gamer.cards.size > 2

    menu
  end

  def dealer_turn
    if table.dealer.points >= 17
      table.status = :gamer_turn
    elsif table.dealer.cards.size < 3
      table.dealer.hit_card(table.deck.card)
    else
      open_action
    end
  end

  def counting_results
    table.results
    table.status = :start
    menu
  end
end
