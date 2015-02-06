class Pawn < Piece

  def move? (destination_x, destination_y)
    if white == true
      self.y + 1 == destination_y
    elsif white == false
      self.y - 1 == destination_y
    else
      return false
    end
  end
end
