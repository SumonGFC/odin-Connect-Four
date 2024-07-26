# frozen_string_literal: true

# store state of each cell in game board
class Cell
  attr_accessor :occupied, :value, :next_cell

  def initialize(next_cell = nil, value = '_', occupied: false)
    @value = value
    @next_cell = next_cell
    @occupied = occupied
  end

  def occupied?
    occupied
  end
end
