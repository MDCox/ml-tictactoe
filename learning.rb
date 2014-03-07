currBoard = "000000000"
fullGame = []

def randMove(currBoard)
  tempBoard = currBoard.dup
  possMoves = (0...tempBoard.length).find_all { |i| tempBoard[i] == "0"}
  tempBoard[possMoves.sample] = "O"
  return tempBoard
end

def saveGame(fullGame)
  fname = "memory.txt"

  lastGame = IO.readlines(fname)[-1]
  gameNum = lastGame[lastGame.index(": ")+2...-1].to_i + 1

  memory = File.open(fname, "a")
  memory.puts (fullGame.to_s + " : " + gameNum.to_s)
  memory.close
end

def checkGame(currBoard)
end

for i in 0..4
  fullGame << currBoard
    puts i.to_s + fullGame.to_s
    puts "\n"
  currBoard = randMove(currBoard)
end

saveGame(fullGame)
