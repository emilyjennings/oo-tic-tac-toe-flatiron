# makes a board with 9 spaces
# the gets function will get user input - choices of 1-9
# the board is filled in the appropriate way already
#figure out who's turn it is and track number of turns, decide based on turn which character
#winner? congratulate, draw? say so



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
    [6, 4, 2]
  ]

  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

  def input_to_index(input)
    @i = input.to_i
    @i = @i-1
    @index = @i
  end


  def move(index, value)
      @board[index]=value
  end



  def position_taken?(index)
    if @board[index] == " " ||
      @board[index] == "" ||
      @board[index] == nil
      return false
    elsif @board[index] == "X" ||
      @board[index] == "O"
      return true
    end
  end



  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end


  def turn_count
    @board.count do |position|
      position == "X" || position == "O"
    end
  end


  def current_player
      @value = turn_count.even? ? "X" : "O"

  end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    input_to_index(input)
    if valid_move?(@index)
      current_player
      move(@index, value)
      display_board
    else
      puts "Please enter 1-9:"
      input = gets.strip
      input_to_index(input)
    end

  end

=begin







  def won?(board)
    WIN_COMBINATIONS.detect do |win_combination| #goes through each individual arrays in the nested array
      win_index_1 = win_combination[0] # gives backthe numbers in the arrays
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if ("#{position_1}" == "X" && "#{position_2}" == "X" && "#{position_3}" == "X")
        return win_combination # return the win_combination indexes that won.
      elsif ("#{position_1}" == "O" && "#{position_2}" == "O" && "#{position_3}" == "O")
        return win_combination

      end
    end
  end


  def full?
      if @board.detect{|place| place == " "}
        return false
      elsif @board.each{|place| place == "X" || place == "O"}
        return true
      end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    WIN_COMBINATIONS.detect do |win_combination| #goes through each individual arrays in the nested array
      win_index_1 = win_combination[0] # gives backthe numbers in the arrays
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if ("#{position_1}" == "X" && "#{position_2}" == "X" && "#{position_3}" == "X")
        return "X"

      elsif ("#{position_1}" == "O" && "#{position_2}" == "O" && "#{position_3}" == "O")
        return "O"
      end
    end
  end


  def play(board)
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner(board)}!"
    else draw?
      puts "Cat's Game!"
    end
  end
=end

end

# every method I build is encapusalted by this class
