require 'spec_helper'

describe Piece do

  it {should belong_to :game}

  it 'will not accept only x value outside range' do
    test_piece = Piece.create(:x => 9, :y => 1)
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

  describe '.horizontal_obstruction?' do
    it 'will return false if there are no pieces in the way' do
      expect(Piece.horizontal_obstruction?(1,1,8,1)).to eq(false)
    end
    it 'will return true if there are pieces in the way' do
      Piece.create({:x => 4, :y => 1, :type => "Rook"})
      expect(Piece.horizontal_obstruction?(1,1,8,1)).to eq(true)
    end
    it 'will return true if there are pieces in the way goint the other direction' do
      Piece.create(:x => 4, :y => 1, :type => "Rook")
      expect(Piece.horizontal_obstruction?(8,1,1,1)).to eq(true)
    end
  end

  describe '.vertical_obstruction?' do
    it 'will return false if there are no pieces in the way' do
      expect(Piece.vertical_obstruction?(1,8,1,1)).to eq(false)
    end
    it 'will return true if there are pieces in the way' do
      Piece.create({:x => 1, :y => 4, :type => "Rook"})
      expect(Piece.vertical_obstruction?(1,8,1,1)).to eq(true)
    end
    it 'will return true if there are pieces in the way going the other direction' do
      Piece.create(:x => 1, :y => 5, :type => "Rook")
      expect(Piece.vertical_obstruction?(1,1,1,8)).to eq(true)
    end
  end

  describe '.diagonal_obstruction?' do
    it 'will return false if there are no pieces in the way' do
      Piece.create(:x => 5, :y => 5, :type => "Rook")
      expect(Piece.diagonal_obstruction?(1,1,3,3)).to eq(false)
    end
    it 'will return true if there are pieces in the way' do
      Piece.create(x: 2, y: 2, type: "Bishop")
      expect(Piece.diagonal_obstruction?(1,1,4,4)).to eq(true)
    end
    it 'will return true if there are pieces in the way other direction' do
      Piece.create(x: 2, y: 2, type: "Bishop")
      expect(Piece.diagonal_obstruction?(4,4,1,1)).to eq(true)
    end
    it 'will return true if there are pieces in the way other direction' do
      Piece.create(x: 4, y: 2, type: "Bishop")
      expect(Piece.diagonal_obstruction?(5,1,3,3)).to eq(true)
    end
  end
end
