module GameOfLife
  class Cell
    def initialize(alive)
      @alive = alive
    end

    def alive?
      @alive
    end

    def tick(alive_neighbors)
      if alive?
        Cell.new(alive_neighbors == 2 || alive_neighbors == 3) 
      else
        Cell.new(alive_neighbors == 3)
      end
    end
    
    def to_s
      alive? ? 'O' : '.'
    end
  end
end
