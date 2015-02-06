require 'spec_helper'

describe Bishop do
  describe ("#move?") do
    it "will not allow a bishop to move where it can't" do
      bishop1 = Bishop.create(x: 1, y: 1, white: true)
      expect(bishop1.move?(2, 3)).to eq(false)
    end
    it "will allow a bishop to move in a positive diagonal line" do
      bishop1 = Bishop.create(x: 1, y: 1, white: true)
      expect(bishop1.move?(3, 3)).to eq(true)
    end
    it "will allow a bishop to move in a negative diagonal line" do
      bishop1 = Bishop.create(x: 8, y: 8, white: true)
      expect(bishop1.move?(3, 3)).to eq(true)
    end
    it "will not allow a bishop to move positive diagonally through a piece in the way" do
      bishop1 = Bishop.create(x: 1, y: 1, white: true)
      Piece.create(x: 4, y: 4, white: true)
      expect(bishop1.move?(6,6)).to eq(false)
    end
    it "will not allow a bishop to move negative diagonally through a piece in the way" do
      bishop1 = Bishop.create(x: 7, y: 7, white: true)
      Piece.create(x: 5, y: 5, white: false)
      expect(bishop1.move?(2,2)).to eq(false)
    end
    it "will allow a bishop to move onto an opponents piece" do
      bishop1 = Bishop.create(x: 1, y: 1, white: true)
      Piece.create(x: 5, y: 5, white: false)
      expect(bishop1.move?(5,5)).to eq(true)
    end
    it "will not allow a bishop to move onto its own piece" do
      bishop1 = Bishop.create(x: 1, y: 1, white: true)
      Piece.create(x: 5, y: 5, white: true)
      expect(bishop1.move?(5,5)).to eq(false)
    end
  end
end
