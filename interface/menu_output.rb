# frozen_string_literal: true

# module MenuOutput
module MenuOutput
  STATUS_PRINT = { start: 'DEAL?', gamer_turn: 'YOUR TURN' }.freeze

  def output_table(table)
    puts "\n        BLACK JACK"
    puts "
  DEALER   $#{table.dealer.account.total_amount}   #{table.dealer.points} pnts.
  #{table.dealer.cards.join(' ')}

  BANK   $#{table.bank}   #{STATUS_PRINT[table.status]}

  GAMER    $#{table.gamer.account.total_amount}   #{table.gamer.points} pnts.
  #{table.gamer.cards.join(' ')}
    "
  end
end
