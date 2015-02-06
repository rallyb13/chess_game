class Bishop < Piece

  def move? (new_x, new_y)
    x_abs = (new_x - self.x).abs
    y_abs = (new_y - self.y).abs
    if x_abs == y_abs
      if self.space_available?(new_x, new_y)
        ! Piece.diagonal_obstruction?(self.x, self.y, new_x, new_y)
      else
        false
      end
    else
      false
    end
  end

end
