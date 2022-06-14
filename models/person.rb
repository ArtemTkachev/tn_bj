# frozen_string_literal: true

# class Person
class Person
  attr_reader :account, :cards, :points
  attr_accessor :shadow_cards

  def initialize(account)
    @account = account
    @cards = []
    @points = 0
    @shadow_cards = true
  end

  def zeroing
    self.cards = []
    self.points = 0
  end

  def hit_card(card)
    @cards << card
    @points += card_points(card)
  end

  def hit_several_cards(*cards)
    cards.each do |card|
      hit_card(card)
    end
  end

  protected

  attr_writer :cards, :points

  def card_points(card)
    return card.value.to_i if ('2'..'10').include?(card.value)

    return 10 if %w[J K Q].include?(card.value)

    return ace_condition if card.value == 'A'
  end

  def ace_condition
    return 11 if (points + 11) <= 21

    1
  end
end
