require "game_of_life/version"

module GameOfLife
  class Cell

    def initialize(alive, neighbors=[])
      @alive = alive
      @neighbors = neighbors
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
      count = 0;
      @neighbors.each do |cell|
        count += 1 if cell.alive?
      end
      count
    end

  end
end
