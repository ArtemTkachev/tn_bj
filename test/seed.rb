# frozen_string_literal: true

Dir['../models/*.rb'].sort!.each { |file| require_relative file }

deck = Deck.new(1)
puts deck
puts deck.cards
puts "\n#{deck.card}"
puts deck
