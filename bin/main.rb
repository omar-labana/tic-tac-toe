#!/usr/bin/env ruby
puts 'Welcome to Ruby\'s Tic-Tac-Toe'
puts 'Please, Enter player 1 name:'
player_1_name = gets.chomp
puts 'Please, Enter player 2 name:'
player_2_name = gets.chomp
puts "#{player_1_name} will play with X and #{player_2_name} will play with O"
puts 'Let\'s Start!'

interface_row = '+---+---+---+'
interface_col = '|'

def print_interface_row(row, col, board_cells = nil)
  puts row
  puts "#{col} 1 #{col} 2 #{col} 3 #{col}"
  puts row
  puts "#{col} 4 #{col} 5 #{col} 6 #{col}"
  puts row
  puts "#{col} 7 #{col} 8 #{col} 9 #{col}"
  puts row
end

print_interface_row(interface_row, interface_col)

puts "It's #{player_1_name} turn!"
puts "Plese select an available cell from the board" 
cell_number = gets.chomp.to_i
if cell_number > 0 && cell_number < 10
  puts "#{player_1_name} choose #{cell_number}"
else 
  puts 'Please enter a valid cell!'
end

puts "It's #{player_2_name} turn!"
puts "Plese select an available cell from the board" 
cell_number = gets.chomp.to_i
if cell_number > 0 && cell_number < 10
  puts "#{player_2_name} choose #{cell_number}"
else 
  puts 'Please enter a valid cell!'
end