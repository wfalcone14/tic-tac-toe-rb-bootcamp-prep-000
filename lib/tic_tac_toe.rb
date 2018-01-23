WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
   ]
   
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(num)
  s = num.to_i - 1
  return s
end

def move(board,input_to_index, current_player)
  board[input_to_index] = current_player(board)
end 

def position_taken?(board,index)
  if board[index] == " " || board[index] == "" || board[index] == nil 
    false
  else board[index] == 'X' || board[index] == "O"
    true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board,index) == false
    true 
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0 
  board.each do |i|
    if  i == "X" || i == "O"
    count += 1 
    end
  end
  return count
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board) 
 WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end  

def over?(board)
  won?(board) || draw?(board) || full?(board)
end   

def winner(board)
 if win_combo = won?(board)
   board[win_combo.first]
  end
end

def play(board)
  n = 0 
  until n == 9
    turn(board)
    n +=1 
  end 
end 