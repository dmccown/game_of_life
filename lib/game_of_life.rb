require "game_of_life/version"

module GameOfLife
  class Board
    def number_of_living_neighbors

    end
  end

  class Cell
    def initialize(alive, x=0, y=0) 
      @alive = alive
      @x = x
      @y = y
    end

    def alive?
      @alive
    end

    def tick
      if alive?
        Cell.new(number_alive_neighbors == 2 || number_alive_neighbors == 3) 
      else
        Cell.new(number_alive_neighbors == 3)
      end
    end

    def number_alive_neighbors
      GameOfLife::Board.number_of_living_neighbors @x, @y
    end
  end
end
