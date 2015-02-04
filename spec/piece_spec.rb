require 'spec_helper'

describe Piece do
  it 'will accept only x values 1-8' do
    test_piece = Piece.create({:x => 9, :y => 1})
    expect(test_piece.save).to eq(false)
  end

  it 'will accept only y values 1-8' do
    test_piece = Piece.create({:x => 1, :y => 10})
    expect(test_piece.save).to eq(false)
  end

end
