class Game < ActiveRecord::Base
  has_many :pieces

  before_create :white_first

  def turn
    if self.white_turn = true
      self.update(:white_turn => false)
    else
      self.update(:white_turn => true)
    end
  end

  private
    def white_first
      self.white_turn = true
    end
end
