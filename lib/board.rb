require 'cell'

module GameOfLife
  class Board
    def initialize(length, height) 
      @length = length
      @height = height
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

    def cycle_game 
      board = Board.new @length, @height
      self.each do | cell |
        board[cell.x][cell.y] = cell.tick self
      end
      board
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
      if (0..@length).member?(x) && (0..@height).member?(y)
        val = @arr[x][y].alive? ? 1 : 0
      end
      val
    end

  end
end
