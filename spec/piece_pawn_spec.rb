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
  end

end
