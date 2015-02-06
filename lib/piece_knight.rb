class Knight < Piece

  def move? (new_x, new_y)
    if on_board?(new_x, new_y)
      x_abs = (new_x - self.x).abs
      y_abs = (new_y - self.y).abs

      if self.space_available?(new_x, new_y)
        if (x_abs == 1) & (y_abs == 2)
          return true
        elsif (x_abs == 2) & (y_abs == 1)
          return true
        else
          return false
        end
      else
        return false
      end
    else
      false
    end
  end
end
