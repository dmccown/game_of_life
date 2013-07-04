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
        row.each do | cell |
          yield cell
        end
      end
    end

    def each_with_index
      @arr.each_with_index do | row, x_index |
        row.each_with_index do | cell, y_index |
          yield cell, x_index, y_index
        end
      end
    end

    def number_of_living_neighbors(x, y)
      count = 0
      count += add_living(x-1, y-1)
      count += add_living(x-1, y)
      count += add_living(x-1, y+1)
      count += add_living(x, y-1)
      count += add_living(x, y-1)
      count += add_living(x+1, y-1)
      count += add_living(x+1, y)
      count += add_living(x+1, y+1)
    end

    def add_living(x, y)
      val = 0
      if (0..@arr.size).member?(x) && (0..@arr[0].size).member?(y)
        val = @arr[x][y].alive? ? 1 : 0
      end
      val
    end

  end
end
