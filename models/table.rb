# frozen_string_literal: true

# class Table
class Table
  attr_reader :gamer,
              :dealer,
              :deck,
              :status,
              :bank

  def initialize(dealer, gamer, deck)
    @gamer = gamer
    @dealer = dealer
    @deck = deck
    @bank = 0
    @status = :start
  end

  def start_card_hit
    dealer.hit_several_cards(deck.card, deck.card)
    gamer.hit_several_cards(deck.card, deck.card)
  end

  def top_up_all_accounts(amount)
    dealer.account.top_up(amount)
    gamer.account.top_up(amount)
  end

  def place_bet(bet)
    dealer.account.withdraw(bet)
    gamer.account.withdraw(bet)
    self.bank = (bet * 2)
  end

  protected

  attr_writer :bank, :status
end
