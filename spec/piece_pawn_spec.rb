require 'spec_helper'

describe Pawn do
  describe('#move?') do
    it 'will allow a white pawn to move forward one space' do
      pawn1 = Pawn.create(x: 1, y: 2, white: true)
      expect(pawn1.move?(1,3)).to eq(true)
    end

    it 'will allow a black pawn to move forward one space' do
      pawn1 = Pawn.create(x:5, y:7, white:false)
      expect(pawn1.move?(5,6)).to eq(true)
    end

    it 'will not allow a black pawn to move sideways' do
      pawn1 = Pawn.create(x:5, y:7, white:false)
      expect(pawn1.move?(6,6)).to eq(false)
    end

    it 'will not allow a pawn to move forward to an occupied space' do
      pawn1 = Pawn.create(x: 1, y: 2, white: true)
      piece1 = Piece.create(x: 1, y: 3, white: false)
      expect(pawn1.move?(1,3)).to eq(false)
    end

    it "will allow a white pawn to move diagonal to an black piece's space" do
      pawn1 = Pawn.create(x: 1, y: 2, white: true)
      piece1 = Piece.create(x: 2, y: 3, white:false)
      expect(pawn1.move?(2,3)).to eq(true)
    end

    it "will allow a black pawn to move one step diagonally to a white piece's space" do
      pawn1 = Pawn.create(x: 3, y: 5, white: false)
      pawn2 = Pawn.create(x: 4, y: 4, white: true)
      expect(pawn1.move?(4,4)).to eq(true)
    end

    it "will not allow a black pawn to move one step diagonally to a black piece's space" do
      pawn1 = Pawn.create(x: 3, y: 5, white: false)
      pawn2 = Pawn.create(x: 4, y: 4, white: false)
      expect(pawn1.move?(4,4)).to eq(false)
    end
  end

end
