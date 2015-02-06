require 'spec_helper'

describe Queen do
  describe ("#move?") do
    it "will not allow a queen to move where it can't" do
      queen1 = Queen.create(x: 1, y: 1, white: true)
      expect(queen1.move?(2, 3)).to eq(false)
    end
    it "will allow a queen to move in a straight vertical line" do
      queen1 = Queen.create(x: 1, y: 1, white: true)
      expect(queen1.move?(1, 3)).to eq(true)
    end
    it "will allow a queen to move in a straight horizontal line" do
      queen1 = Queen.create(x: 1, y: 1, white: true)
      expect(queen1.move?(3, 1)).to eq(true)
    end
    it "will allow a queen to move in a positive diagonal line" do
      queen1 = Queen.create(x: 1, y: 1, white: true)
      expect(queen1.move?(3, 3)).to eq(true)
    end
    it "will allow a queen to move in a negative diagonal line" do
      queen1 = Queen.create(x: 8, y: 8, white: true)
      expect(queen1.move?(3, 3)).to eq(true)
    end
    it "will not allow a queen to move horizontal through a piece in the way" do
      queen1 = Queen.create(x: 1, y: 1, white: true)
      Piece.create(x: 4, y: 1, white: true)
      expect(queen1.move?(6,1)).to eq(false)
    end
    it "will not allow a queen to move vertically through a piece in the way" do
      queen1 = Queen.create(x: 1, y: 1, white: true)
      Piece.create(x: 1, y: 5, white: false)
      expect(queen1.move?(1,8)).to eq(false)
    end
    it "will not allow a queen to move positive diagonally through a piece in the way" do
      queen1 = Queen.create(x: 1, y: 1, white: true)
      Piece.create(x: 4, y: 4, white: true)
      expect(queen1.move?(6,6)).to eq(false)
    end
    it "will not allow a queen to move negative diagonally through a piece in the way" do
      queen1 = Queen.create(x: 7, y: 7, white: true)
      Piece.create(x: 5, y: 5, white: false)
      expect(queen1.move?(2,2)).to eq(false)
    end
    it "will allow a queen to move onto an opponents piece" do
      queen1 = Queen.create(x: 1, y: 1, white: true)
      Piece.create(x: 5, y: 5, white: false)
      expect(queen1.move?(5,5)).to eq(true)
    end
    it "will not allow a queen to move onto its own piece" do
      queen1 = Queen.create(x: 1, y: 1, white: true)
      Piece.create(x: 5, y: 5, white: true)
      expect(queen1.move?(5,5)).to eq(false)
    end
  end
end
