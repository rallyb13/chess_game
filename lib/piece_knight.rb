class Knight < Piece

  def move? (destination_x, destination_y)
    x_abs = (destination_x - self.x).abs
    y_abs = (destination_y - self.y).abs

    if self.space_available?(destination_x, destination_y)
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
  end
end
