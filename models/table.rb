# frozen_string_literal: true

# class Table
class Table
  attr_reader :gamer, :dealer, :deck

  def initialize(gamer, dealer, deck)
    @gamer = gamer
    @dealer = dealer
    @deck = deck
  end
end
