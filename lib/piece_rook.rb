class Rook < Piece
  def possible_move?(x_new,y_new)
    if (self.x == x_new) | (self.y == y_new)
      true
    else
      false
    end
  end
end
