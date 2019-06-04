require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/ui'



RSpec.describe Ui do

  describe "Format okay?" do
    let(:new_board) {Board.new}
    let(:player1) {Player.new('Eric', "X", new_board)}
    let(:player2) {Player.new('Marcos', "O", new_board)}
    let(:game) {Game.new(player1, player2, new_board)}

    it "Check Format for 3 digits" do
      game.separator
      expect(game.format_ok?("123")).to eql(nil)
    end

    it "Check Format for wrong digits" do
      game.separator
      expect(game.format_ok?("44")).to eql(nil)
    end

    it "Check Format for right digits" do
      game.separator
      expect(game.format_ok?("11")).to eql(true)
    end

  end

  describe "Board position okay?" do
    let(:new_board) {Board.new}
    let(:player1) {Player.new('Eric', "X", new_board)}
    let(:player2) {Player.new('Marcos', "O", new_board)}
    let(:game) {Game.new(player1, player2, new_board)}

    it "Position taken" do
      game.separator
      new_board.values = {"11" => "O", "12" => "O", "13" => "O"}
      expect(new_board.position_ok?("11")).to eql(nil)
    end

    it "Position available" do
      game.separator
      new_board.values = {"11" => "O", "12" => "O", "13" => "O"}
      expect(new_board.position_ok?("21")).to eql(true)
    end

  end


end