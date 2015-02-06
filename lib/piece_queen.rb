class Queen < Piece

  def move? (new_x, new_y)
    if self.space_available?(new_x, new_y)
      if (new_x - self.x).abs == (new_y - self.y).abs #diagonal
        ! Piece.diagonal_obstruction?(self.x, self.y, new_x, new_y)
      elsif self.x == new_x #vertical
        ! Piece.vertical_obstruction?(self.x, self.y, new_x, new_y)
      elsif self.y == new_y #horizontal
        ! Piece.horizontal_obstruction?(self.x, self.y, new_x, new_y)
      else
        false
      end
    else
      false
    end
  end

end


# def move? (new_x, new_y)
#   x_abs = (new_x - self.x).abs
#   y_abs = (new_y - self.y).abs
#   if x_abs == y_abs
#     if self.space_available?(new_x, new_y)
#       ! Piece.diagonal_obstruction?(self.x, self.y, new_x, new_y)
#     else
#       false
#     end
#   else
#     false
#   end
# end

# def move? (destination_x,destination_y)
#   if self.space_available?(destination_x, destination_y)
#     if (self.x == destination_x)
#       ! Piece.vertical_obstruction?(self.x, self.y, destination_x, destination_y)
#     elsif (self.y == destination_y)
#       ! Piece.horizontal_obstruction?(self.x, self.y, destination_x, destination_y)
#     else
#       false
#     end
#   else
#     false
#   end
# end
