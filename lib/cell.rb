module GameOfLife
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
