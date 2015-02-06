require 'spec_helper'

describe King do
  describe ("#move?") do
    it "will not allow a king to move more than 1 space" do
      king1 = King.create(x: 5, y: 1, white: true)
      expect(king1.move?(5, 3)).to eq(false)
    end
    it "will allow a king to move up one space" do
      king1 = King.create(x: 5, y: 1, white: true)
      expect(king1.move?(5, 2)).to eq(true)
    end
    it "will allow a king to move down one space" do
      king1 = King.create(x: 5, y: 2, white: true)
      expect(king1.move?(5, 1)).to eq(true)
    end
    it "will allow a king to move left one space" do
      king1 = King.create(x: 5, y: 1, white: true)
      expect(king1.move?(4, 1)).to eq(true)
    end
    it "will allow a king to move right one space" do
      king1 = King.create(x: 5, y: 1, white: true)
      expect(king1.move?(6, 1)).to eq(true)
    end
    it "will allow a king to move diagonally down and left one space" do
      king1 = King.create(x: 5, y: 5, white: true)
      expect(king1.move?(4, 4)).to eq(true)
    end
    it "will allow a king to move diagonally down and right one space" do
      king1 = King.create(x: 5, y: 5, white: true)
      expect(king1.move?(6, 4)).to eq(true)
    end
    it "will allow a king to move diagonally up and left one space" do
      king1 = King.create(x: 5, y: 5, white: true)
      expect(king1.move?(4, 6)).to eq(true)
    end
    it "will allow a king to move diagonally up and right one space" do
      king1 = King.create(x: 5, y: 5, white: true)
      expect(king1.move?(6, 6)).to eq(true)
    end
    it "will allow a king to move onto an opponents piece" do
      king1 = King.create(x: 5, y: 1, white: true)
      Piece.create(x: 5, y: 2, white: false)
      expect(king1.move?(5,2)).to eq(true)
    end
    it "will not allow a king to move onto its own piece" do
      king1 = King.create(x: 5, y: 1, white: true)
      Piece.create(x: 5, y: 2, white: true)
      expect(king1.move?(5,2)).to eq(false)
    end
  end
end
