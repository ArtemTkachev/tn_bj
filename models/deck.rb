# frozen_string_literal: true

# class Deck
class Deck
  CARDS_SUITS = %W[\u2660 \u2665 \u2663 \u2666].freeze
  CARDS_VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_reader :number, :cards

  def initialize
    @number = :unknown
    @cards = []
    create_deck
  end

  def card
    cards.pop
  end

  def to_s
    "Deck ##{number} cards:#{cards.size}"
  end

  protected

  def create_deck
    CARDS_SUITS.each do |suit|
      CARDS_VALUES.each { |value| cards << Card.new(value, suit) }
    end
    cards.shuffle!
  end
end
