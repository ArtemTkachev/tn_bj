# frozen_string_literal: true

require_relative './interface/menu_input'
require_relative './interface/menu_output'
require_relative './lib/actions'

# module Main
module Main
  extend MenuOutput
  extend MenuInput
  extend Actions

  TITLE = 'BLACK JACK GAME'

  puts TITLE
  menu(:start)
end
