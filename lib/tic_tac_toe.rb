# makes a board with 9 spaces
# the gets function will get user input - choices of 1-9
# the board is filled in the appropriate already
#figure out who's turn it is and track number of turns
#winner? congratulate, draw? say so

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def input_to_index(input)
    i = input.to_i
    i = i-1
  end

  def position_taken?(array, index)
    if array[index] == " " ||
      array[index] == "" ||
      array[index] == nil
      return false
    elsif array[index] == "X" ||
      array[index] == "O"
      return true
    end
  end

  def valid_move?(array, index)
    if !position_taken?(array, index) &&
      index.between?(0,8)
        return true
    else
      return false
    end
  end

  def turn_count(board)
    counter = 0
    board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      else
        counter += 0
      end
    end
    counter
  end


  def current_player(board)
    turns = turn_count(board)
    turns.even? ? "X" : "O"
  end

  def move(array, index, value)

      array[index]=value

  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    i = input_to_index(input)
    if valid_move?(board, i)
      value = current_player(board)
      move(board, i, value)
      display_board(board)
    else
      puts "Please enter 1-9:"
      input = gets.strip
      i = input_to_index(input)
    end

  end


  def turn_count(board)
    counter = 0
    board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      else
        counter += 0
      end
    end
    counter
  end


  def current_player(board)
    turns = turn_count(board)
    turns.even? ? "X" : "O"
  end


  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def won?(board)
    WIN_COMBINATIONS.detect do |win_combination| #goes through each individual arrays in the nested array
      win_index_1 = win_combination[0] # gives backthe numbers in the arrays
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3

      if ("#{position_1}" == "X" && "#{position_2}" == "X" && "#{position_3}" == "X")
        return win_combination # return the win_combination indexes that won.
      elsif ("#{position_1}" == "O" && "#{position_2}" == "O" && "#{position_3}" == "O")
        return win_combination

      end
    end
  end


  def full?(board)
      if board.detect{|place| place == " "}
        return false
      elsif board.each{|place| place == "X" || place == "O"}
        return true
      end
  end

  def draw?(board)
    full?(board) && !won?(board)
  end

  def over?(board)
    draw?(board) || won?(board)
  end

  def winner(board)
    WIN_COMBINATIONS.detect do |win_combination| #goes through each individual arrays in the nested array
      win_index_1 = win_combination[0] # gives backthe numbers in the arrays
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3

      if ("#{position_1}" == "X" && "#{position_2}" == "X" && "#{position_3}" == "X")
        return "X"

      elsif ("#{position_1}" == "O" && "#{position_2}" == "O" && "#{position_3}" == "O")
        return "O"
      end
    end
  end

  def play(board)
    until over?(board)
      turn(board)
    end

    if won?(board)
      puts "Congratulations #{winner(board)}!"
    else draw?(board)
      puts "Cat's Game!"
    end
  end
end

# every method I build is encapusalted by this class
