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

def print_interface_row(row, col, _board_cells = nil)
  puts row
  puts "#{col} 1 #{col} 2 #{col} 3 #{col}"
  puts row
  puts "#{col} 4 #{col} 5 #{col} 6 #{col}"
  puts row
  puts "#{col} 7 #{col} 8 #{col} 9 #{col}"
  puts row
end

print_interface_row(interface_row, interface_col)
move = 1
playing = nil
game = GameState.new()
p game.game_board,game.game_state
while move <= 9
  playing = if move.odd?
              player_1_name
            else
              player_2_name
            end
  puts "It's #{playing}\'s turn!"
  puts 'Please select an available cell from the board'
  cell_number = gets.chomp.to_i
  if cell_number.positive? && cell_number < 10
    puts "#{playing} choose #{cell_number}"
    print_interface_row(interface_row, interface_col)
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
