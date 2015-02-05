class Piece < ActiveRecord::Base
  belongs_to :game

  validates(:x, :presence => true, inclusion: { in: (1..8) })
  validates(:y, :presence => true, inclusion: { in: (1..8) })

  def self.horizontal_obstruction?(x1,y1,x2,y2)
    y_matches = Piece.where(y: y1)
    if x1 > x2
      x_low = x2
      x_high = x1
    elsif x1 < x2
      x_low = x1
      x_high = x2
    end
    if y_matches.empty?
      return false
    else
      y_matches.each do |piece|
        if piece.x.between?(x_low + 1, x_high - 1)
        return true
        else
        return false
      end
      end
    end
  end

  def self.vertical_obstruction?(x1,y1,x2,y2)
    x_matches = Piece.where(x: x1)
    if y1 > y2
      y_low = y2
      y_high = y1
    elsif y1 < y2
      y_low = y1
      y_high = y2
    end
    if x_matches.empty?
      return false
    else
      x_matches.each do |piece|
        if piece.y.between?(y_low +1, y_high - 1)
        return true
        else
        return false
      end
      end
    end
  end


  def self.diagonal_obstruction?(x1, y1, x2, y2)
    if x1 > x2
      x_low = x2
      x_high = x1
    elsif x1 < x2
      x_low = x1
      x_high = x2
    end

    if Piece.any?
      Piece.all.each do |piece|
        x_abs = (piece.x - x1).abs
        y_abs = (piece.y - y1).abs
        if x_abs == y_abs && piece.x.between?(x_low, x_high)
          return true
        else
          return false
        end
      end
    else
      return false
    end
  end

  def space_available? (x,y)
    my_team = self.white
    occupant = Piece.find_by_x_and_y(x,y)
    if occupant.white == my_team
      false
    else
      true
    end
  end


  def self.render(x,y)
    content = Piece.find_by_x_and_y(x,y)
    if content != nil
      returned = "<span class='glyphicon glyphicon-"
      piece = content.type
      if piece == "Rook"
        returned = returned + "tower"
      elsif piece == "Bishop"
        returned = returned + "bishop"
      end
      if content.white
        returned = returned + " yin'></span>"
      else
        returned = returned + "'></span>"
      end
    else
      ""
    end
  end


end
