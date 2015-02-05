class Rook < Piece
  def move? (destination_x,destination_y)
    if (self.x == destination_x)
      ! Piece.vertical_obstruction?(self.x, self.y, destination_x, destination_y)
    elsif (self.y == destination_y)
      ! Piece.horizontal_obstruction?(self.x, self.y, destination_x, destination_y)
    else
      false
    end
  end
end
