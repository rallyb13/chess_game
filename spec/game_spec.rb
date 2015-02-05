require "spec_helper"

describe Game do
  it { should have_many :pieces }

  it "always sets up this game with white moving first" do
    test_game = Game.create
    expect(test_game.white_turn).to eq(true)
  end

  describe "#turn" do
    it "will change whose turn it is" do
      game1 = Game.create(white_turn: true)
      game1.turn
      expect(game1.white_turn).to eq(false)
    end
  end

end
