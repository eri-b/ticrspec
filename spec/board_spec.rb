require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/ui'



RSpec.describe Board do

  describe "Game Results" do
    let(:new_board) {Board.new}
    let(:player1) {Player.new('Eric', "X", new_board)}
    let(:player2) {Player.new('Marcos', "O", new_board)}
    let(:game) {Game.new(player1, player2, new_board)}

    it "Winning Board 1" do
      new_board.values = {"11" => "O", "12" => "O", "13" => "O"}
      new_board.score["row 1"] = "OOO"
      expect(game.game_on).to eql(false)
    end

    it "Winning Board 2" do
      new_board.values = {"21" => "X", "22" => "X", "23" => "X"}
      new_board.score["row 2"] = "XXX"
      expect(game.game_on).to eql(false)
    end

    it "Winning Board 3" do
      new_board.values = {"31" => "X", "32" => "X", "33" => "X"}
      new_board.score["row 3"] = "XXX"
      expect(game.game_on).to eql(false)
    end

    it "Winning Board 4" do
      new_board.values = {"11" => "X", "21" => "X", "31" => "X"}
      new_board.score["col 1"] = "XXX"
      expect(game.game_on).to eql(false)
    end

    it "Winning Board 5" do
      new_board.values = {"12" => "X", "22" => "X", "32" => "X"}
      new_board.score["col 2"] = "XXX"
      expect(game.game_on).to eql(false)
    end

    it "Winning Board 6" do
      new_board.values = {"13" => "X", "23" => "X", "33" => "X"}
      new_board.score["col 3"] = "XXX"
      expect(game.game_on).to eql(false)
    end

    it "Winning Board 7" do
      new_board.values = {"11" => "X", "22" => "X", "33" => "X"}
      new_board.score["diag 1"] = "XXX"
      expect(game.game_on).to eql(false)
    end

    it "Winning Board 8" do
      new_board.values = {"13" => "X", "22" => "X", "31" => "X"}
      new_board.score["diag 2"] = "XXX"
      expect(game.game_on).to eql(false)
    end

    it "Game not over" do
      new_board.values = {"31" => "X", "32" => "O", "33" => "X"}
      new_board.score["row 3"] = "XOX"

      expect(game.game_on).to be_truthy
    end

    it "Game is draw" do
      new_board.values = {"11" => "X", "12" => "O", "13" => "X", "21" => "O", "22" => "X", "23" => "O", "31" => "O", "32" => "X", "33" => "O"}
      new_board.score["row 1"] = "XOX"
      new_board.score["row 2"] = "OXO"
      new_board.score["row 3"] = "OXO"
      new_board.score["col 1"] = "XOO"
      new_board.score["col 2"] = "OXX"
      new_board.score["col 3"] = "XOO"
      new_board.score["diag1 1"] = "XXO"
      new_board.score["diag 2"] = "XXO"


      expect(game.game_on).to eql(false)
    end

  end


end
