class Piece < ActiveRecord::Base
  belongs_to :player
  validates(:x, :presence => true, acceptance: { accept: (1..8) })
  validates(:y, :presence => true, acceptance: { accept: (1..8) })

end
