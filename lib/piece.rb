class Piece < ActiveRecord::Base
  belongs_to :game

  validates(:x, :presence => true, inclusion: { in: (1..8) })
  validates(:y, :presence => true, inclusion: { in: (1..8) })

  scope(:between_ys, lambda do |y1, y2|
    where("y >= :y1 AND y <= :y2",
          { :y1 => y1, :y2 => y2 })
  end)

  scope(:between_xs, lambda do |x1, x2|
    where("x >= :x1 AND x <= :x2",
          { :x1 => x1, :x2 => x2 })
  end)

  def self.y_match(y1)
    y_matches = []
    Piece.all.each do |piece|
      if piece.y == y1
        y_matches.push(piece)
      end
    end
    y_matches
  end

  def self.x_match(x1)
    x_matches = []
    Piece.all.each do |piece|
      if piece.x == x1
        x_matches.push(piece)
      end
    end
    x_matches
  end

  def self.horizontal_clear(x1,y1,x2,y2)
    if x1 > x2
      x_low = x2
      x_high = x1
    elsif x1 < x2
      x_low = x1
      x_high = x2
    end

    y_matches = Piece.y_match(y1)
    blocking_pieces = y_matches.between_xs(x_low, x_high)

    if blocking_pieces.any?
       false
    else
      true
    end
  end


  #   y_matches = Piece.find_all_by_y(y1) || []
  #   (x_low + 1 .. x_high - 1).each do |individual_x|
  #     y_matches.each do |piece|
  #       if piece.x == individual_x
  #         clear = false
  #       end
  #     end
  #   end
  #   clear
  # end

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
