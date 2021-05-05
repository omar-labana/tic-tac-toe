#!/usr/bin/env ruby
require_relative '../lib/game'
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
puts "#{player_1_name} will play with X and #{player_2_name} will play with O"
puts 'Let\'s Start!'

interface_row = '+---+---+---+'
interface_col = '|'

def print_interface_row(row, col, board_cells)
  puts row
  puts "#{col} #{board_cells[0]} #{col} #{board_cells[1]} #{col} #{board_cells[2]} #{col}"
  puts row
  puts "#{col} #{board_cells[3]} #{col} #{board_cells[4]} #{col} #{board_cells[5]} #{col}"
  puts row
  puts "#{col} #{board_cells[6]} #{col} #{board_cells[7]} #{col} #{board_cells[8]} #{col}"
  puts row
end

move = 1
playing = nil
game = GameState.new
p game.game_board, game.game_state
while move <= 9
  playing = if move.odd?
              player_1_name
            else
              player_2_name
            end
  # Gem.win_platform? ? (system "cls") : (system "clear")
  print_interface_row(interface_row, interface_col, game.game_board)
  puts "It's #{playing}\'s turn!"
  puts 'Please select an available cell from the board'
  cell_number = gets.chomp.to_i
  if cell_number>-1 && cell_number < 10
    puts "#{playing} choose #{cell_number}"
    if cell_number == 5
      puts "#{playing} played a draw move."
      break
    end
    if cell_number == 9
      puts "#{playing} played a winning move."
      break
    end
    move += 1
  else
    puts 'Please enter a valid cell!'
  end
end
