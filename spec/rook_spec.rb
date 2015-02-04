require('spec_helper')

describe(Rook) do
  describe('#possible_move?') do
    it 'will return false if a move is not possible' do
        rook1 = Rook.create(x: 1, y: 1)
        expect(rook1.possible_move?(2, 2)).to eq(false)
    end
    it 'will return true if a move is possible' do
        rook1 = Rook.create(x: 1, y: 1)
        expect(rook1.possible_move?(1, 8)).to eq(true)
    end
    it 'will return false if a move has another piece in the way' do
        rook1 = Rook.create(x: 1, y: 1)
        rook2 = Rook.create(x: 1, y: 2)
        expect(rook1.possible_move?(1, 3)).to eq(false)
    end
  end
end
