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

def input_to_index(input)
  input = input.to_i - 1
  return input
end

def move(board,input,pos)
  board[input] = pos
end 

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board,index) == false
    true 
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = input_to_index(gets.strip)
  if valid_move?(board,input) == true
    move(board,input,pos="X")
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