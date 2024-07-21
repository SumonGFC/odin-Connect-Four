# frozen_string_literal: true

# store state of each cell in game board
class Cell
  attr_writer :occupied
  attr_reader :symbol

  def initialize(symbol, occupied: false)
    @symbol = symbol
    @occupied = occupied
  end
end
