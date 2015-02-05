class Game < ActiveRecord::Base
  has_many :pieces

  before_create :white_first
  after_create :add_pieces

  def turn
    if self.white_turn? == true
      self.update(:white_turn => false)
    else
      self.update(:white_turn => true)
    end
  end

  private
    def white_first
      self.update(:white_turn => true)
    end

    def add_pieces
      Piece.all.each do |piece|
        piece.destroy
      end
      Piece.create(x: 1, y: 1, white: true, type: "Rook", game_id: self.id)
      Piece.create(x: 8, y: 1, white: true, type: "Rook", game_id: self.id)
      Piece.create(x: 1, y: 8, white: false, type: "Rook", game_id: self.id)
      Piece.create(x: 8, y: 8, white: false, type: "Rook", game_id: self.id)
      Piece.create(x: 3, y: 1, white: true, type: "Bishop", game_id: self.id)
      Piece.create(x: 6, y: 1, white: true, type: "Bishop", game_id: self.id)
      Piece.create(x: 3, y: 8, white: false, type: "Bishop", game_id: self.id)
      Piece.create(x: 6, y: 8, white: false, type: "Bishop", game_id: self.id)
    end
end
