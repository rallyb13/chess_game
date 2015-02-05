require 'bundler/setup'
Bundler.require :default
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

get '/' do
  Game.create
  @oneone = Piece.render(1, 1)
  erb :index
end
