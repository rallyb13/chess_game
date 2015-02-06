class Piece < ActiveRecord::Base
  belongs_to :game

  validates(:x, :presence => true, inclusion: { in: (1..8) })
  validates(:y, :presence => true, inclusion: { in: (1..8) })

  def self.horizontal_obstruction?(x1,y1,x2,y2)
    if x1 > x2
      x_low = x2
      x_high = x1
    elsif x1 < x2
      x_low = x1
      x_high = x2
    end
    obstruction = false
    y_matches = Piece.where(y: y1)
    if y_matches.empty?
      obstruction = false
    else
      y_matches.each do |piece|
        if piece.x.between?(x_low + 1, x_high - 1)
          obstruction = true
        end
      end
    end
    obstruction
  end

  def self.vertical_obstruction?(x1,y1,x2,y2)
    if y1 > y2
      y_low = y2
      y_high = y1
    elsif y1 < y2
      y_low = y1
      y_high = y2
    end
    obstruction = false
    x_matches = Piece.where(x: x1)
    if x_matches.empty?
      obstruction = false
    else
      x_matches.each do |piece|
        if piece.y.between?(y_low +1, y_high - 1)
          obstruction = true
        end
      end
    end
    obstruction
  end


  def self.diagonal_obstruction?(x1, y1, x2, y2)
    if x1 > x2
      x_low = x2
      x_high = x1
    elsif x1 < x2
      x_low = x1
      x_high = x2
    end
    obstruction = false
    if Piece.any?
      Piece.all.each do |piece|
        x_abs = (piece.x - x1).abs
        y_abs = (piece.y - y1).abs
        if x_abs == y_abs && piece.x.between?(x_low + 1, x_high -1)
          obstruction = true
        end
      end
    else
      obstruction = false
    end
    obstruction
  end

  def space_available? (x,y)
    my_team = self.white
    occupant = Piece.find_by_x_and_y(x,y)
    if occupant == nil
      true
    elsif occupant.white == my_team
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
      elsif piece == "Knight"
        returned = returned + "knight"
      elsif piece == "Queen"
        returned = returned + "queen"
      elsif piece == "Pawn"
        returned = returned + "pawn"
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

  def move_it(destination_x,destination_y)
    captured = Piece.find_by_x_and_y(destination_x,destination_y)
    if captured != nil
      captured.destroy
    end
    self.update(x:destination_x, y:destination_y)
  end


end
