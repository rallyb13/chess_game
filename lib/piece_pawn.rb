class Pawn < Piece

  def move? (destination_x, destination_y)
    obstruction = Piece.find_by_x_and_y(destination_x,destination_y)
    if obstruction == nil
      if white == true
        self.y + 1 == destination_y && self.x == destination_x
      elsif white == false
        self.y - 1 == destination_y && self.x == destination_x
      else
        return false
      end
    else
      if self.white == true && obstruction.white == false
        self.y + 1 == destination_y && (self.x - destination_x).abs == 1
      elsif self.white == false && obstruction.white == true
        self.y - 1 == destination_y && (self.x - destination_x).abs == 1
      else
        return false
      end
    end
  end
end
