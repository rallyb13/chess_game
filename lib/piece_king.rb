class King < Piece
  def move? (new_x, new_y)
    if on_board?(new_x, new_y)
      if space_available?(new_x, new_y)
        if new_x == self.x && new_y == self.y + 1  #move forward
          true
        elsif new_x == self.x && new_y == self.y - 1   #move backward
          true
        elsif new_x == self.x + 1 && new_y == self.y   #move right
            true
        elsif new_x == self.x - 1 && new_y == self.y   #move left
            true
        elsif new_x == self.x + 1 && new_y == self.y + 1   #move digonal up and right
            true
        elsif new_x == self.x - 1 && new_y == self.y + 1   #move digonal up and left
            true
        elsif new_x == self.x + 1 && new_y == self.y - 1   #move digonal down and right
            true
        elsif new_x == self.x - 1 && new_y == self.y - 1   #move digonal down and left
            true
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
