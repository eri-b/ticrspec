require_relative '../lib/board'
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
    it "test 1" do
      game = Board.new
      # @score = Hash.new
      # @score["row 1"] = "XXX"

      expect(game.game_over).to eql(true)
    end
  end
end
