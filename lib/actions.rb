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

  attr_reader :table, :info

  BET = 10
  ACCOUNT_AMOUNT = 100

  def initialize
    @table = Table.new(Dealer.new(Account.new(ACCOUNT_AMOUNT)),
                       Gamer.new(Account.new(ACCOUNT_AMOUNT)),
                       Deck.new)
    @info = ''
  end

  def create_game
    table.zeroing
    table.double_card_hit
    begin
      table.place_bet(BET)
    rescue RuntimeError => e
      self.info = e.message
    end
    table.status = :gamer_turn
  end

  def hit_action
    if table.gamer.cards.size < 3
      table.gamer.hit_card(table.deck.card)
      table.status = :gamer_turn_again
    end
    dealer_turn
  end

  def stand_action
    return open_action if table.dealer.cards.size > 2 || table.dealer.points >= 17

    dealer_turn
  end

  def open_action
    table.dealer.shadow_cards = false
    counting_results
  end

  protected

  attr_writer :info

  def cards_number_more(number)
    open_action if table.gamer.cards.size > number && table.dealer.cards.size > number
  end

  def dealer_turn
    table.dealer.hit_card(table.deck.card) if table.dealer.cards.size < 3 && table.dealer.points < 17
  end

  def counting_results
    table.results
    table.status = :start
  end
end
