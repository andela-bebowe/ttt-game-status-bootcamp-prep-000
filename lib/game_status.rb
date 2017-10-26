# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  win_arr = WIN_COMBINATIONS.detect do |win_combo|
    winHash = Hash.new(0);
    win_combo.all? do |value|
      winHash[board[value]] += 1
    end
    winHash['X'] == 3 || winHash['O'] == 3
  end
end

def full?(board)
  board.all? { |e| e != " "  }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    winHash = Hash.new(0);
    WIN_COMBINATIONS.each do |win_combo|
      win_combo.all? do |value|
        winHash[board[value]] += 1
      end
    end
    print winHash
    winHash['X'] == 3 ? 'X' : winHash['O'] == 3 ? '0' : nil
  end
end
board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
winner(board)
