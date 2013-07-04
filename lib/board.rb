require 'cell'

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
end
