require 'game_of_life/version'
require 'board'

module GameOfLife
  def self.run(length, height, seed, count)
    board = GameOfLife::Board.new length, height, seed

    (0..count).each do | index |
      yield board.to_s, index
      board = board.cycle_game
    end
  end
end
