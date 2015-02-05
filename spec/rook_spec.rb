require('spec_helper')

describe(Rook) do
  describe ("#move?") do
    it "will not allow a rook to move where it can't" do
      rook1 = Rook.create(x: 1, y: 1, white: true)
      expect(rook1.move?(2, 3)).to eq(false)
    end
    it "will allow a rook to move in a straight vertical line" do
      rook1 = Rook.create(x: 1, y: 1, white: true)
      expect(rook1.move?(1, 3)).to eq(true)
    end
    it "will allow a rook to move in a straight horizontal line" do
      rook1 = Rook.create(x: 1, y: 1, white: true)
      expect(rook1.move?(3, 1)).to eq(true)
    end
    it "will not allow a rook to move horizontal through a piece in the way" do
      rook1 = Rook.create(x: 1, y: 1, white: true)
      Piece.create(x: 4, y: 1)
      expect(rook1.move?(6,1)).to eq(false)
    end
    it "will not allow a rook to move vertically through a piece in the way" do
      rook1 = Rook.create(x: 1, y: 1, white: true)
      Piece.create(x: 1, y: 5)
      expect(rook1.move?(1,8)).to eq(false)
    end
  end
end
