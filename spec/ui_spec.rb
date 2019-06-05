require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/ui'



RSpec.describe Ui do

  describe "Player Input Format Tests" do
    let(:new_board) {Board.new}
    let(:player1) {Player.new('Eric', "X", new_board)}
    let(:player2) {Player.new('Marcos', "O", new_board)}
    let(:game) {Game.new(player1, player2, new_board)}

    it "Player input cannot more than 2 digits." do
      game.separator
      expect(game.format_ok?("123")).to eql(nil)
    end

    it "Player input cannot contain numbers other than 1,2,3" do
      game.separator
      expect(game.format_ok?("44")).to eql(nil)
    end

    it "Player input must contain 2 digits, each digit 1,2, or 3" do
      game.separator
      expect(game.format_ok?("11")).to eql(true)
    end

  end

  describe "Is board position available for player?" do
    let(:new_board) {Board.new}
    let(:player1) {Player.new('Eric', "X", new_board)}
    let(:player2) {Player.new('Marcos', "O", new_board)}
    let(:game) {Game.new(player1, player2, new_board)}

    it "Board position is taken, player must choose new move." do
      game.separator
      new_board.values = {"11" => "O", "12" => "O", "13" => "O"}
      expect(new_board.position_ok?("11")).to eql(nil)
    end

    it "Board position is available, and move can be made." do
      game.separator
      new_board.values = {"11" => "O", "12" => "O", "13" => "O"}
      expect(new_board.position_ok?("21")).to eql(true)
    end

  end


end
