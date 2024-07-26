# frozen_string_literal: true

require_relative '../../lib/column'

describe Column do
  describe '#initialize' do
    let(:col) { described_class.new }

    it 'should create array of length 6 by default' do
      expect(col.list.length).to eq 6
    end

    it 'should initialize a list containing ONLY Cell objects' do
      expect(col.list).to all(be_an_instance_of Cell)
    end

    it 'should update reference to next_cell to point to next cell in list' do
      cells = col.list
      (cells.length - 1).times do |i|
        expect(cells[i].next_cell).to eq cells[i + 1]
      end
    end

    it "should have a nil reference in the last cell's next_cell variable" do
      expect(col.list.last.next_cell).to be_nil
    end
  end

  describe '#next_free_cell' do
    let(:column) { described_class.new }

    it 'should return the last cell with a new list' do
      cell = column.next_free_cell
      expect(cell).to be(column.list.last)
    end

    it 'should return the cell before the first occupied cell' do
      column.list.last.occupied = true
      expect(column.next_free_cell).to be(column.list[-2])
    end

    it 'should return nil if the first cell is occupied' do
      column.list.first.occupied = true
      expect(column.next_free_cell).to be_nil
    end
  end

  describe '#update_next_cell' do
    let(:column) { described_class.new }

    it 'should change the last cell with fresh list' do
      expect { column.update_next_cell('X') }
        .to change { column.list.last.occupied }
        .from(false)
        .to(true)
    end

    it 'should return false if head is occupied' do
      column.list.first.occupied = true
      expect(column.update_next_cell('X')).to be false
    end

    it 'should leave occupied cells alone' do
      column.list.last.occupied = true
      column.list.last.value = 'O'
      column.update_next_cell('X')
      expect(column.list.last.value).to be 'O'
    end

    it 'should return false if all cells occupied' do
      column.list.length.times { column.update_next_cell('X') }
      expect(column.update_next_cell('O')).to be false
    end
  end
end
