require 'game_of_life/version'
require 'board'

module GameOfLife
  def self.run
    board = GameOfLife::Board.new 4, 4
    board[1][1] = GameOfLife::Cell.new true
    board[1][2] = GameOfLife::Cell.new true
    board[2][1] = GameOfLife::Cell.new true
    board[2][2] = GameOfLife::Cell.new true

    (0..100).each do | index |
      puts "#{index} ============== #{index}"
      puts board.to_s
      board = board.cycle_game
      sleep 0.5
    end
  end
end
