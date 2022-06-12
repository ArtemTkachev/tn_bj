# frozen_string_literal: true

Dir['../models/*.rb'].sort!.each { |file| require_relative file }
require_relative '../interface/menu_output'

# module Actions
module Actions
  include MenuOutput

  def create_game
    table = Table.new(Person.new(Account.new(100)),
                      Person.new(Account.new(100)),
                      Deck.new)
    start_card_hit(table.dealer)
    start_card_hit(table.gamer)
    output_table
  end

  protected

  def start_card_hit(person)
    person.hit_card(table.deck.card)
    person.hit_card(table.deck.card)
  end
end
