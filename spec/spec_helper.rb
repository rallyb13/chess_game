ENV["RACK_ENV"] = "test"
require "bundler/setup"
Bundler.require :default, :test
Dir[File.dirname(__FILE__) + "/../lib/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.after :each do
    Player.all.each do |player|
      player.destroy
    end
    Game.all.each do |game|
      game.destroy
    end
    Piece.all.each do |piece|
      piece.destroy
    end
  end
end
