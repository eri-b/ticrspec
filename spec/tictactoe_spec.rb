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

    it "O wins" do
      new_board.values = {"11" => "O", "12" => "O", "13" => "O"}
      new_board.score["row 1"] = "OOO"

      expect(game.game_on).to eql(false)
    end

    it "X wins" do
      new_board.values = {"31" => "X", "32" => "X", "33" => "X"}
      new_board.score["row 3"] = "XXX"

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

  describe "Critical Methods" do

    it "Check Format" do
      expect(check_format("45")).to output("Wrong format. Please enter your move: ").to_stdout
    end
  end

end
