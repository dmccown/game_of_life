require 'cell'

module GameOfLife
  class Board
    def initialize(length, height) 
      @length = length
      @height = height
      @arr = Array.new(length) { Array.new(height) { GameOfLife::Cell.new(false) } }
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
      self.each_with_index do | cell, x, y |
        board[x][y] = cell.tick number_of_living_neighbors(x, y)
      end
      board
    end

    def each_with_index
      @arr.each_with_index do | row, x|
        row.each_with_index do | cell, y|
          yield self[x][y], x, y
        end
      end
    end

    def number_of_living_neighbors(x, y)
      count = 0
      count += add_living(x-1, y-1)
      count += add_living(x-1, y)
      count += add_living(x-1, y+1)
      count += add_living(x, y-1)
      count += add_living(x, y+1)
      count += add_living(x+1, y-1)
      count += add_living(x+1, y)
      count += add_living(x+1, y+1)
    end

    def add_living(x, y)
      val = 0
      if (0..@length-1).member?(x) && (0..@height-1).member?(y)
        val = @arr[x][y].alive? ? 1 : 0
      end
      val
    end

    def to_s
      output = ""
      @arr.each { | row | output += "#{row.join}\n" }
      output
    end
  end
end
