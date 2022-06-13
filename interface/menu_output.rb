# frozen_string_literal: true

# module MenuOutput
module MenuOutput
  STATUS_PRINT = { start: 'DEAL?', gamer_turn: 'YOUR TURN' }.freeze

  def output_table
    puts "\n        BLACK JACK"
    puts "
  DEALER   $#{table.dealer.account.total_amount}   #{show_points(table.dealer)} pnts.
  #{show_cards(table.dealer)}

  BANK   $#{table.bank.total_amount}   #{show_status}

  GAMER    $#{table.gamer.account.total_amount}   #{show_points(table.gamer)} pnts.
  #{show_cards(table.gamer)}
    "
  end

  protected

  def show_cards(person)
    return person.cards.join(' ') unless person.shadow_cards

    line = ''
    person.cards.empty? ? line = '** **' : person.cards.size.times { line += '** ' }
    line
  end

  def show_points(person)
    return person.points unless person.shadow_cards

    '**'
  end

  def show_status
    return STATUS_PRINT[table.status] if !table.status == :start || table.winner == :unknown

    "#{result_line}  AGAIN #{STATUS_PRINT[table.status]}"
  end

  def result_line
    if table.winner == :nobody
      'DRAW'
    else
      "YOU #{table.winner == :dealer ? 'LOSE' : 'WIN'}!"
    end
  end
end
