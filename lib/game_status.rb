# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant


WIN_COMBINATIONS = [
  [0,1,2], #1st horizontal row
  [3,4,5], #2nd horizontal row
  [6,7,8], #3rd horizontal row
  [0,3,6], #1st vertical row
  [1,4,7], #2nd vertical row
  [2,5,8], #3rd vertical row
  [0,4,8], #1st diagonal row
  [6,4,2]  #2nd diagonal row
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination # return the win_combination indexes that won.
  else
    false
  end
end

def full?(board)
  board.none? do |cell|
    cell == " "
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board) and !won?(board)
    return true
  elsif !full?(board) and !won?(board)
    return false
  end
end

def over?(board)
  won?(board) or draw?(board) or full?(board)
end

def winner?(board)
  board[won?(board)[0]]
end
