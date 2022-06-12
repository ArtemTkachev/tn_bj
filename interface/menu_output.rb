# frozen_string_literal: true

# module MenuOutput
module MenuOutput
  def output_table(params)
    puts '      BLACK JACK'
    puts "
  DEALER      $#{params[:dealer_account]}
  #{params[:dealer_cards].join(' ')}\n
  $#{params[:bank]}\n
  GAMER       $#{params[:gamer_account]}
  #{params[:gamer_cards].join(' ')}
    "
  end
end
