class Bishop < Piece
  def possible_move? (new_x, new_y)
    x_abs = (new_x - self.x).abs
    y_abs = (new_y - self.y).abs
    x_abs == y_abs
  end
end
