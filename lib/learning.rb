curr_board = "000000000"
full_game = []

def rand_move(curr_board)
  temp_board = curr_board.dup
  poss_moves = (0...temp_board.length).find_all{|i| temp_board[i] == "0"}
  temp_board[poss_moves.sample] = "O"
  temp_board
end

def save_game(full_game, game_result)
  #game_result is 2 if a win, 1 if tie, 0 if loss.
  fname = "memory.txt"

  last_game = IO.readlines(fname)[-1]
  game_num = last_game[last_game.index(": ")+2...-1].to_i + 1

  memory = File.open(fname, "a")
  memory.puts ("#{game_result} #{full_game.join(" ")} : #{game_num}")
  memory.close
end

def get_stats(curr_board)
  stats = {}
  fname = "memory.txt"
  
  File.open(fname).each do |line|
    if line.include?(curr_board)
      index = line.index(curr_board)
      next_board = line[index+10..index+18]
      win_or_loss = line[0].to_i

      if stats.has_key?(next_board)
        stats[next_board] += win_or_loss
      else
        stats[next_board] = win_or_loss
      end
    end
  end

  stats
end

def choose_move(stats, curr_board)
  poss_moves = {}
  key_total = stats.values.inject(:+)
  
  upper_range = 100
  stats.each do |key, val|
    lower_range = upper_range - (val.to_f / key_total * 100).to_i
    poss_moves[(lower_range..upper_range)] = key
    upper_range -= (val.to_f / key_total * 100).to_i
  end
  
  rand_num = (1...100).to_a.sample

  poss_moves.each{|key, val| if key.include?(rand_num) then return val end}
  print "GOING RANDOM!"
  return rand_move(curr_board)
end

def make_move(curr_board, full_game)
  next_move = choose_move(get_stats(curr_board), curr_board)
  full_game << next_move
  return next_move, full_game
end