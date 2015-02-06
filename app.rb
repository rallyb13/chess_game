require 'bundler/setup'
Bundler.require :default
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }
also_reload "./lib/*/**.rb"

get '/' do
  Game.all.each do |game|
    game.destroy
  end
  Game.create
  erb :index
end

get '/game' do
  @message = ""
  @game = Game.first
  @black_pieces = Piece.all.where(white: false)
  @white_pieces = Piece.all.where(white: true)
  erb :game
end

post '/game' do
  x_value = params.fetch('x_value').to_i
  y_value = params.fetch('y_value').to_i
  piece = Piece.find(params.fetch('piece').to_i)
  if piece.move?(x_value, y_value)
    piece.move_it(x_value,y_value)
    Game.first.turn
    redirect '/game'
  else
    @message = "Invalid move! Try again."
    @game = Game.first
    @black_pieces = Piece.all.where(white: false)
    @white_pieces = Piece.all.where(white: true)
    erb :game
  end
end
