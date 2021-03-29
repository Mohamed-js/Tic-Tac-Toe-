#!/usr/bin/env ruby

# rubocop:disable Metrics/BlockNesting

require_relative '../lib/game_logic'

puts 'Welcome to the Tic Tac Toe '
puts 'Player_one, Enter your name'
player_one_name = gets.chomp.capitalize
puts 'Player_two, Enter your name'

player_two_name = gets.chomp.capitalize
symp = false

while symp == false
  puts " #{player_one_name} Please enter your symbol [X, O]"
  player1_symp = gets.chomp.upcase
  if %w[X O].include?(player1_symp)
    symp = true
    player2_symp = (player1_symp == 'X' ? 'O' : 'X')
  else
    puts 'Invalid symbol'
  end
end

player1 = Player.new(player_one_name, player1_symp)
player2 = Player.new(player_two_name, player2_symp)

puts "Hi #{player1.name} and #{player2.name} welcome to Tic Tac Toe game"
puts "#{player1.name} your symbol is #{player1.symbol}"
puts "#{player2.name} your symbol is #{player2.symbol}"

# display the body game "the board"
game = Game.new

repeat = true


while repeat
  board = Board.new
  game_on = true
  puts board.display_board
  while game_on
    winner = false
    draw = false

    # loop for each move
    puts "#{player1.name}, your turn. Choose a number between 1 and 9"
    movement = false
    while movement == false
      p_one = gets.chomp.to_i
      def exists(p_one,board)
        board.include?(p_one)
      end
      if exists(p_one, board.board)
        movement = true
        board.update_board(p_one, player1.symbol)
        board.display_board
        winner = game.check(game.check_win(board.board, player1))
        if winner == true
          puts "The winner is #{player1.name}"
          # rubocop:disable Layout/LineLength
          puts "\n \nThe result is \n #{player1.name}(#{player1.winnings}) VS #{player2.name}(#{player2.winnings}) \n \n Draws >> #{game.draws} "
          # rubocop:enable Layout/LineLength
        end
        want = true if winner == true
        while want
          puts 'Do you want to play again? [y, n]'
          again = gets.chomp
          case again
          when 'y'
            repeat = true
            want = false
          when 'n'
            repeat = false
            puts 'end game'
            want = false
            game_on = false
            break if winner
          end
        end

        if board.board.none?(Numeric)
          puts 'This is a draw'
          game.set_draws
          # rubocop:disable Layout/LineLength
          puts "\n \nThe result is \n #{player1.name}(#{player1.winnings}) VS #{player2.name}(#{player2.winnings}) \n \n Draws >> #{game.draws} "
          # rubocop:enable Layout/LineLength
          draw = true
          want = true
          while want
            puts 'Do you want to play again? [y, n]'
            again = gets.chomp
            case again
            when 'y'
              repeat = true
              want = false
            when 'n'
              puts 'end game'
              repeat = false
              want = false
              game_on = false
              break if draw
            end
          end
        end
      else
        puts 'wrong input'
      end
    end

    break if winner || draw

    # loop for each move
    puts "#{player2.name}, your turn. Choose a number between 1 and 9"
    movement = false
    while movement == false
      p_two = gets.chomp.to_i
      def exists(p_two,board)
        board.include?(p_two)
      end
      if exists(p_two, board.board)
        movement = true
        board.update_board(p_two, player2.symbol)
        board.display_board
        winner = game.check(game.check_win(board.board, player2))
        if winner == true
          puts "The winner is #{player2.name}"
          # rubocop:disable Layout/LineLength
          puts "\n \nThe result is \n #{player1.name}(#{player1.winnings}) VS #{player2.name}(#{player2.winnings}) \n \n Draws >> #{game.draws} \n \n"
          # rubocop:enable Layout/LineLength
        end
        want = true if winner == true
        while want
          puts 'Do you want to play again? [y, n]'
          again = gets.chomp
          case again
          when 'y'
            repeat = true
            want = false
          when 'n'
            puts 'end game'
            repeat = false
            want = false
            game_on = false
            break if winner
          end
        end

        if board.board.none?(Numeric)
          puts 'This is a draw'
          game.set_draws
          # rubocop:disable Layout/LineLength
          puts "\n \nThe result is \n #{player1.name}(#{player1.winnings}) VS #{player2.name}(#{player2.winnings}) \n \n Draws >> #{game.draws} "
          # rubocop:enable Layout/LineLength
          draw = true
          want = true
          while want
            puts 'Do you want to play again? [y, n]'
            again = gets.chomp
            case again
            when 'y'
              repeat = true
              want = false
            when 'n'
              puts 'end game'
              repeat = false
              want = false
              game_on = false
              break if draw
            end
          end
        end
      else
        puts 'wrong input'
      end
    end

    break if winner || draw
  end

end

# rubocop:enable Metrics/BlockNesting
