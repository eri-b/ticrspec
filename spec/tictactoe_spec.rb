require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/ui'

# require_relative '../bin/game'

# RSpec.describe 'Board' do

#   describe "#game_over" do

  #   it "returns true if draw (full board)" do
  #     @board = {}
  #     @score = {}
  #     expect(game_over).to eql(true)
  #   end
  #
  #   it "returns true if winner and full board" do
  #     @board = []
  #     @score =[]
  #     expect(game_over).to eql(true)
  #   end
#     it "returns true if winner and partial board" do
#       @board = {"11":"X", "12":"X", "13":"X"}
#       @score = {"row 1": "XXX"}
#       expect(Board.game_over).to eql(true)
#     end

#   end


# end

RSpec.describe Board do
  describe "#score" do
    let(:new_board) {Board.new}
    let(:player1) {Player.new('a', "X", new_board)}
    let(:player2) {Player.new('b', "O", new_board)}

    let(:game) {Game.new(player1, player2, new_board)}

    it "test 1" do
      
      new_board.score["row 1"] = "OOO"

      expect(game.game_on).to eql(false)
    end
  end
end