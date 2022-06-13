# frozen_string_literal: true

# class Table
class Table
  attr_reader :gamer,
              :dealer,
              :deck,
              :bank
  attr_accessor :status, :winner

  def initialize(dealer, gamer, deck)
    @gamer = gamer
    @dealer = dealer
    @deck = deck
    @bank = Account.new(0)
    @status = :start
    @winner = :unknown
  end

  def double_card_hit
    dealer.hit_several_cards(deck.card, deck.card)
    gamer.hit_several_cards(deck.card, deck.card)
  end

  def place_bet(bet)
    dealer.account.withdraw(bet)
    gamer.account.withdraw(bet)
    bank.top_up(bet * 2)
  end

  def results
    self.winner = result
    if result == :nobody
      dealer.account.top_up(bank.total_amount / 2)
      gamer.account.top_up(bank.total_amount / 2)
    else
      send(result).account.top_up(bank.total_amount)
    end
    bank.withdraw(bank.total_amount)
  end

  protected

  def result
    return :dealer if gamer.points > 21 || (gamer.points < dealer.points && dealer.points < 22)

    return :nobody if gamer.points == dealer.points

    :gamer
  end
end
