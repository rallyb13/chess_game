class Rook < Piece
  def possible_move?(x_new,y_new)
    if (self.x == x_new) | (self.y == y_new)
      true
    else
      false
    end
  end
end


x_matches = Pieces.find_by_x(self.x)
(self.y + 1 .. y_new - 1).each do |y|
  x_matches.each

  # Pieces.all.each do |piece|
  #   if piece.x, piece.y == self.x, y
  #
  # end
end
