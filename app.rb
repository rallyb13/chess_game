require 'bundler/setup'
Bundler.require :default
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

get '/' do
  @game = Game.create
  @black_pieces = Piece.all.where(white: false)
  @white_pieces = Piece.all.where(white: true)
  erb :index
end

post '/' do
  x_value = params.fetch('x_value').to_i
  y_value = params.fetch('y_value').to_i
  piece = Piece.find(params.fetch('piece').to_i)
  piece.move(x_value, y_value)
  redirect '/'
end
