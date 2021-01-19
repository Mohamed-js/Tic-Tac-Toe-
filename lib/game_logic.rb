# frozen_string_literal: true

# Class player
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @win_times = 0
  end

  def winnings
    @win_times
  end

  def set_winnings
    @win_times += 1
  end
end

# Class of Board
class Board
  attr_reader :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def update_board(number, symbol)
    @board[number - 1] = symbol
  end

  def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '---------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '---------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end
end

# Class of Game
class Game
  attr_reader :draws

  def initialize
    @draws = 0
  end

  def set_draws
    @draws += 1
  end

  def check_win(board, player)
    check = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]]
    check.each do |arr|
      if board[arr[0]] == board[arr[1]] && board[arr[1]] == board[arr[2]]
        player.set_winnings
        return player
      end
    end
    false
  end

  # Check winner
  def check(check_win_meth)
    return unless check_win_meth != false

    true
  end
end

# Mock method to test..
public

def exists(p_one, board)
  board.include?(p_one)
end
