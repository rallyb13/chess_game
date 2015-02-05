require 'spec_helper'

describe Piece do

  it {should belong_to :game}

  it 'will not accept only x value outside range' do
    test_piece = Piece.create({:x => 9, :y => 1})
    expect(test_piece.save).to eq(false)
  end
  it 'will accept x values 1-8' do
    test_piece = Piece.create({:x => 8, :y => 1})
    expect(test_piece.save).to eq(true)
  end

  it 'will accept only y values 1-8' do
    test_piece = Piece.create({:x => 1, :y => 10})
    expect(test_piece.save).to eq(false)
  end

  describe '.horizontal_clear?' do
    it 'will return true if there are no pieces in the way' do
      expect(Piece.horizontal_clear(1,1,8,1)).to eq(true)
    end
    it 'will return false if there are pieces in the way' do
      Piece.create({:x => 4, :y => 1, :type => "Rook"})
      expect(Piece.horizontal_clear(1,1,8,1)).to eq(false)
    end
  end

end
