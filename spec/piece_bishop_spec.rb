require 'spec_helper'

describe Bishop do
  describe '#possible_move?' do
    it 'will return false if a move is not possible' do
      bishop = Bishop.create(x: 1, y: 1)
      expect(bishop.possible_move?(2, 1)).to eq(false)
    end
    it 'will return true if a move is possible' do
      bishop = Bishop.create(x: 2, y: 3)
      expect(bishop.possible_move?(4, 5)).to eq(true)
    end
  end
end
