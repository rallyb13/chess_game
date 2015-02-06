class Pawn < Piece

  def move? (destination_x, destination_y)
    obstruction = Piece.find_by_x_and_y(destination_x,destination_y)
    obstructing_white = Piece.find_by_x_and_y(destination_x, 3)
    obstructing_black = Piece.find_by_x_and_y(destination_x, 6)
    if obstruction == nil
      if self.white == true && self.x == destination_x
        if self.y == 2 && destination_y == 4 && obstructing_white == nil
          return true
        else
          self.y + 1 == destination_y
        end
      elsif self.white == false && self.x == destination_x
        if self.y == 7 && destination_y == 5 && obstructing_black == nil
          return true
        else
        self.y - 1 == destination_y
        end
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
