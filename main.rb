require './lib/learning'

full_game = []

while true
  puts "enter current board: "
  curr_board = gets.chomp    

  if curr_board == "win"
    save_game(full_game, 2)
    break
  elsif curr_board == "tie"
    save_game(full_game, 1)
    break
  elsif curr_board == "lose"
    save_game(full_game, 0)
    break
  else
    curr_board, full_game = make_move(curr_board, full_game)
    print curr_board
  end
end

p full_game