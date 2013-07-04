require "game_of_life/version"

module GameOfLife
  class Board
    def initialize(length, height) 
      @arr = Array.new(length) { |x| Array.new(height) { |y| GameOfLife::Cell.new(false, x, y) } }
    end

    def [](x)
      @arr[x]
    end

    def each
      @arr.each do | row |
        yield row
      end
    end

    def each_with_index
      @arr.each_with_index do | row, index |
        yield row, index
      end
    end

    def number_of_living_neighbors(x, y)
      0
    end
  end

  class Cell
    attr_reader :x, :y

    def initialize(alive, x=0, y=0) 
      @alive = alive
      @x = x
      @y = y
    end

    def alive?
      @alive
    end

    def tick(board)
      alive_neighbors = board.number_of_living_neighbors @x, @y
      if alive?
        Cell.new(alive_neighbors == 2 || alive_neighbors == 3) 
      else
        Cell.new(alive_neighbors == 3)
      end
    end
  end
end
