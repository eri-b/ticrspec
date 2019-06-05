require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/ui'



RSpec.describe Game do

  describe "Player turns" do
    let(:new_board) {Board.new}
    let(:player1) {Player.new('Eric', "X", new_board)}
    let(:player2) {Player.new('Marcos', "O", new_board)}
    let(:game) {Game.new(player1, player2, new_board)}

    it "Even counters should be player 1" do
      game.separator
      expect(game.turn(4)).to eql(player1)
    end

    it "Odd counters should be player 2" do
      game.separator
      expect(game.turn(3)).to eql(player2)
    end

  end



end
