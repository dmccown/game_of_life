require 'game_of_life/version'
require 'board'

module GameOfLife
  def self.run(args)
    board = GameOfLife::Board.new args[0].to_i, args[1].to_i

    (0..100).each do | index |
      yield board.to_s, index
      board = board.cycle_game
    end
  end
end
