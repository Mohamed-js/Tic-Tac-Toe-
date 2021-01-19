# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require_relative '../lib/game_logic'

player = Player.new('mohamed', 'X')
game   = Game.new

describe Player do
  describe '#initialize' do
    it 'returns mohamed' do
      expect(player.name).to eq('mohamed')
    end
  end
  describe '#initialize' do
    it 'returns X' do
      expect(player.symbol).to eq('X')
    end
  end

  describe '#set_winnings' do
    it 'increases number of winnings' do
      player.set_winnings
      expect(player.winnings).to eq(1)
    end
  end
end

describe Game do
  # CHECK ROW WINNINGS
  describe 'check_win' do
    it 'returns the winner when first row wins' do
      board = Board.new
      board.update_board(1, 'X')
      board.update_board(2, 'X')
      board.update_board(3, 'X')
      expect(game.check_win(board.board, player)).to eq(player)
    end
    describe 'check_win' do
      it 'returns the winner when second row wins' do
        board = Board.new
        board.update_board(4, 'X')
        board.update_board(5, 'X')
        board.update_board(6, 'X')
        expect(game.check_win(board.board, player)).to eq(player)
      end
    end

    describe 'check_win' do
      it 'returns the winner when third row wins' do
        board = Board.new
        board.update_board(7, 'X')
        board.update_board(8, 'X')
        board.update_board(9, 'X')
        expect(game.check_win(board.board, player)).to eq(player)
      end
    end
  end

  # CHECK COLUMNS WINNINGS
  describe 'check_win' do
    it 'returns the winner when first column wins' do
      board = Board.new
      board.update_board(1, 'O')
      board.update_board(4, 'O')
      board.update_board(7, 'O')
      expect(game.check_win(board.board, player)).to eq(player)
    end

    it 'returns the winner when second column wins' do
      board = Board.new
      board.update_board(2, 'O')
      board.update_board(5, 'O')
      board.update_board(8, 'O')
      expect(game.check_win(board.board, player)).to eq(player)
    end

    it 'returns the winner when third column wins' do
      board = Board.new
      board.update_board(3, 'O')
      board.update_board(6, 'O')
      board.update_board(9, 'O')
      expect(game.check_win(board.board, player)).to eq(player)
    end
  end

  # CHECK DIAGONAL WINNINGS
  describe 'check_win' do
    it 'returns the winner when diagonal wins' do
      board = Board.new
      board.update_board(1, 'O')
      board.update_board(5, 'O')
      board.update_board(9, 'O')
      expect(game.check_win(board.board, player)).to eq(player)
    end
    it 'returns the winner when diagonal wins' do
      board = Board.new
      board.update_board(3, 'O')
      board.update_board(5, 'O')
      board.update_board(7, 'O')
      expect(game.check_win(board.board, player)).to eq(player)
    end
  end

  describe '#set_draws' do
    it 'increases number of draws' do
      game.set_draws
      expect(game.draws).to eq(1)
    end
  end
end

# TESTING WRONG INPUTS

describe '#exists' do
  # Negative Values
  it "returns 'false' when negative" do
    board = Board.new
    expect(exists(-1, board.board)).to eq(false)
  end

  # String Values
  it "returns 'false' when negative" do
    board = Board.new
    expect(exists('x', board.board)).to eq(false)
  end

  # Taken Values
  it "returns 'false' when negative" do
    board = Board.new
    board.update_board(3, 'O')
    expect(exists(3, board.board)).to eq(false)
  end

  # Not in 1..9 Values
  it "returns 'false' when negative" do
    board = Board.new
    expect(exists(10, board.board)).to eq(false)
  end
end

# rubocop:enable Metrics/BlockLength
