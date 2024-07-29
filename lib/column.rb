# frozen_string_literal: true

require_relative './cell'

# Linked-list like implementation to represent columns in GameBoard
class Column
  attr_reader :list, :head

  def initialize(size = 6)
    @list = []
    size.times { append(Cell.new) }
    @head = list.first
  end

  def next_free_cell
    return nil if head.occupied

    cell = head
    # nil check needs to come before .occupied check
    cell = cell.next_cell until cell.next_cell.nil? || cell.next_cell.occupied
    cell
  end

  def update_next_cell(val)
    return false if head.occupied

    cell = next_free_cell
    cell.value = val
    cell.occupied = true # will return true
  end

  def top
    index = 0
    list.each do |cell|
      break if cell.occupied

      index += 1
    end
    index
  end

  private

  def append(cell)
    @list.last.next_cell = cell unless list.empty?
    @list << cell
  end
end
