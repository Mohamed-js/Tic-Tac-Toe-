require_relative '../lib/game_logic'

player = Player.new("mohamed","X")
game   = Game.new


describe Player do
    describe '#initialize' do
        it "returns mohamed" do
            expect(player.name).to eq("mohamed")
        end
    end
    describe '#initialize' do
        it "returns X" do
            expect(player.symbol).to eq("X")
        end
    end
end


describe Game do
    # CHECK ROW WINNINGS
    describe "check_win" do
        it "returns the winner when first row wins" do
            board = Board.new
            board.update_board(1, "X")
            board.update_board(2, "X")
            board.update_board(3, "X")
            expect(game.check_win(board.board, player)).to eq(player)
        end

        it "returns the winner when second row wins" do
            board = Board.new
            board.update_board(4, "X")
            board.update_board(5, "X")
            board.update_board(6, "X")
            expect(game.check_win(board.board, player)).to eq(player)
        end

        it "returns the winner when third row wins" do
            board = Board.new
            board.update_board(7, "X")
            board.update_board(8, "X")
            board.update_board(9, "X")
            expect(game.check_win(board.board, player)).to eq(player)
        end
    end

    #CHECK COLUMNS WINNINGS 
    describe "check_win" do
        it "returns the winner when first column wins" do
            board = Board.new
            board.update_board(1, "O")
            board.update_board(4, "O")
            board.update_board(7, "O")
            expect(game.check_win(board.board, player)).to eq(player)
        end

        it "returns the winner when second column wins" do
            board = Board.new
            board.update_board(2, "O")
            board.update_board(5, "O")
            board.update_board(8, "O")
            expect(game.check_win(board.board, player)).to eq(player)
        end

        it "returns the winner when third column wins" do
            board = Board.new
            board.update_board(3, "O")
            board.update_board(6, "O")
            board.update_board(9, "O")
            expect(game.check_win(board.board, player)).to eq(player)
        end
    end
end
