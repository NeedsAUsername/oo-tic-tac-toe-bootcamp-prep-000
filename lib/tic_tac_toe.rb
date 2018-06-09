class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5], 
    [6, 7, 8], 
    [0, 3, 6], 
    [1, 4, 7], 
    [2, 5, 8], 
    [0, 4, 8], 
    [2, 4, 6]
    ]
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(board, index, current_player)
    board[index] = current_player
  end
  
  def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
  end
  
  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index) 
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
  
  def won?(board)
    WIN_COMBINATIONS.each do |array|
      if position_taken?(board, array[0]) == true && board[array[0]] == board[array[1]] && board[array[2]] == board[array[0]]
      return array 
      end
    end 
    return false
  end 

  def full?(board)
    status = board.select{ |cell| cell == "X" || cell == "O" }
    if status.length == 9
      return true
    else 
      return false
    end 
  end 

  def draw?(board)
    if full?(board) == true && won?(board) == false
      return true
    end
  end
  
  def over?(board)
    return draw?(board) || won?(board)  # returns draw?board. if draw?board is false, return won?board
  end

  def winner(board)
    if won?(board) != false
      return board[won?(board)[0]]
    end
  end
  

end 