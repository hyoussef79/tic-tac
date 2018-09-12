# frozen_string_literal: true

require './app/board.rb'

puts 'Starting tic-tac-toe game...'
puts 'Insert the row & column when you enter the position (ex-1A, 3B).'
players = %w[X O]
current_player = players.sample
board = Board.new(current_player)
board.display
until board.full_board? || board.winner
  board.player_move(current_player)
  current_player = board.next_turn(current_player)
  board.display
end

if board.winner
  puts 'Player ' + board.next_turn(current_player) + ' wins.'
else
  puts 'Tie Game.'
end
puts 'Game Over'
