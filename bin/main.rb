#!/usr/bin/env ruby
require_relative '../lib/game'
require_relative '../lib/players'

def print_interface(board_cells)
  row = '+---+---+---+'
  col = '|'
  puts row
  puts "#{col} #{board_cells[0]} #{col} #{board_cells[1]} #{col} #{board_cells[2]} #{col}"
  puts row
  puts "#{col} #{board_cells[3]} #{col} #{board_cells[4]} #{col} #{board_cells[5]} #{col}"
  puts row
  puts "#{col} #{board_cells[6]} #{col} #{board_cells[7]} #{col} #{board_cells[8]} #{col}"
  puts row
end
# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/MethodLength

def start_game
  puts 'Welcome to Ruby\'s Tic-Tac-Toe'
  puts 'Please, Enter player 1 name:'
  player_1_name = gets.chomp
  while player_1_name.empty?
    puts 'Please enter a valid name for player 1.'
    player_1_name = gets.chomp
  end
  puts 'Please, Enter player 2 name:'
  player_2_name = gets.chomp
  while player_2_name.empty?
    puts 'Please enter a valid name for player 2.'
    player_2_name = gets.chomp
  end
  players = Players.new(player_1_name, player_2_name)
  puts "#{players.player1} will play with X and #{players.player2} will play with O"
  puts 'Let\'s Start!'
  game = GameState.new
  playing = nil
  turn = 1
  until game.game_over?
    playing = if turn.odd?
                players.player1
              else
                players.player2
              end
    symbol = if turn.odd?
               'X'
             else
               'O'
             end

    print_interface(game.game_board)
    puts "It's #{playing}\'s turn!"
    puts 'Please select an available cell from the board'
    loop do
      cell_number = gets.chomp.to_i
      if game.valid_placement?(cell_number)
        game.place_item(cell_number, symbol)
        break
      else
        puts 'Please select a valid cell from the board'
      end
    end
    if game.game_over? == 'draw'
      print_interface(game.game_board)
      puts 'GAME OVER! Draw!'
    elsif game.game_over?
      print_interface(game.game_board)
      puts "GAME OVER! #{playing} has won the game!"
    end
    turn += 1
  end
  p game.game_board
end
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/MethodLength

start_game
