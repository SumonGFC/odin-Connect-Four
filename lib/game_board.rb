# frozen_string_literal: true

require_relative './column'

# stores state of the game board
class GameBoard
  attr_reader :board, :raw_board

  def initialize(rows = 6, cols = 7)
    @board = Array.new(cols) { Column.new(rows) }
    @raw_board = @board.map(&:list)
  end

  def print_board
    raw_board.transpose.each do |row|
      puts row.map(&:value).join(' ')
    end
    puts("\n", (1..7).to_a.join(' '), "\n")
  end

  def update_cell(col, val); end
end

test = GameBoard.new
test.print_board
test.board[0].update_next_cell('X')
test.board[0].update_next_cell('O')
test.board[0].update_next_cell('X')
test.board[0].update_next_cell('A')
test.board[0].update_next_cell('X')
test.board[0].update_next_cell('X')
test.board[0].update_next_cell('X')
test.board[0].update_next_cell('X')
test.board[0].update_next_cell('X')
test.board[0].update_next_cell('X')
test.board[0].update_next_cell('X')
test.board[0].update_next_cell('X')
test.print_board
