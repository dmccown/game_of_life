require 'game_of_life/version'
require 'board'

module GameOfLife
  def self.run(args)
    board = GameOfLife::Board.new args[0].to_i, args[1].to_i
    board[1][1] = GameOfLife::Cell.new true
    board[1][2] = GameOfLife::Cell.new true
    board[1][3] = GameOfLife::Cell.new true

    (0..100).each do | index |
      puts "#{index} ============== #{index}"
      puts board.to_s
      board = board.cycle_game
      sleep 0.5
    end
  end
end
