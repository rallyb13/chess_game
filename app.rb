require 'bundler/setup'
Bundler.require :default
require './lib/piece'
require './lib/piece_bishop'
require './lib/piece_king'
require './lib/piece_knight'
require './lib/piece_pawn'
require './lib/piece_queen'
require './lib/piece_rook'
require './lib/game'

# also_reload "./lib/*/**.rb"

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
  if piece = Piece.find(params.fetch('piece').to_i)
    if piece.white == Game.first.white_turn
      if piece.move?(x_value, y_value)
        piece.move_it(x_value,y_value)
    # if piece.promotion?
        Game.first.turn
      else
        @message = "Invalid move! Try again."
        @game = Game.first
        @black_pieces = Piece.all.where(white: false)
        @white_pieces = Piece.all.where(white: true)
        erb :game
      end
    end
  end
  redirect '/game'
end
