# frozen_string_literal: true

# class Table
class Table
  attr_reader :gamer,
              :dealer,
              :deck,
              :bank,
              :winner
  attr_accessor :status

  def initialize(dealer, gamer, deck)
    @gamer = gamer
    @dealer = dealer
    @deck = deck
    @bank = Account.new(0)
    @status = :start
    @winner = :unknown
  end

  def zeroing
    self.deck = Deck.new
    gamer.zeroing
    dealer.zeroing
    gamer.shadow_cards = false
    dealer.shadow_cards = true
  end

  def double_card_hit
    dealer.hit_several_cards(deck.card, deck.card)
    gamer.hit_several_cards(deck.card, deck.card)
  end

  def place_bet(bet)
    enough_funds = dealer.account.enough_funds?(bet) && gamer.account.enough_funds?(bet)
    raise "There are no more funds for betting in the account('s)!" unless enough_funds

    dealer.account.withdraw(bet)
    gamer.account.withdraw(bet)
    bank.top_up(bet * 2)
  end

  def results
    self.winner = who_wins
    top_up_accounts
    bank.withdraw(bank.total_amount)
  end

  protected

  attr_writer :winner, :deck

  def top_up_accounts
    return send(winner).account.top_up(bank.total_amount) unless winner == :nobody

    half_bank_assign(dealer.account)
    half_bank_assign(gamer.account)
  end

  def half_bank_assign(account)
    account.top_up(bank.total_amount / 2)
  end

  def who_wins
    return :dealer if gamer.points > 21 || (gamer.points < dealer.points && dealer.points < 22)

    return :nobody if gamer.points == dealer.points

    :gamer
  end
end
