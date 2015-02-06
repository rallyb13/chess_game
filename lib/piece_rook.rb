class Rook < Piece

  def move? (new_x,new_y)
    if on_board?(new_x, new_y)
      if self.space_available?(new_x, new_y)
        if (self.x == new_x)
          ! Piece.vertical_obstruction?(self.x, self.y, new_x, new_y)
        elsif (self.y == new_y)
          ! Piece.horizontal_obstruction?(self.x, self.y, new_x, new_y)
        else
          false
        end
      else
        false
      end
    else
      false
    end
  end

end
