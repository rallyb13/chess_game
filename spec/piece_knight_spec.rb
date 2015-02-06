require('spec_helper')

describe Knight do
  describe('#move?') do
    it "will recognize a valid move" do
      knight1 = Knight.create(x:2, y:1, white: true)
      expect(knight1.move?(3,3)).to eq(true)
    end

    it "will recognize a valid move downboard and farther along x" do
      knight1 = Knight.create(x: 2, y: 8, white:false)
      expect(knight1.move?(4,7)).to eq(true)
    end

    it "will not allow an invalid knight move" do
      knight1 = Knight.create(x: 2, y:1, white: true)
      expect(knight1.move?(1,1)).to eq(false)
    end


    it "will allow a move onto a space held by an opponent" do
      knight1 = Knight.create(x: 2, y: 1, white: true)
      knight2 = Knight.create(x: 3, y: 3, white: true)
      expect(knight1.move?(3,3)). to eq(false)
    end
  end
end
