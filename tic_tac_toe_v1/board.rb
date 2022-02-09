require_relative "./human_player.rb"


class Board 

    attr_reader :grid

    def initialize
        @grid = Array.new(3) { Array.new(3, '_')}
    end

    def valid?(pos)
        pos.each do |idx| 
            if idx >= @grid.length
                p "out of bounds"
                return false
            else
                return true
            end
        end
    
    end

    def empty?(pos)
        @grid[pos[0]][pos[1]] == '_' ? true : false 
    end

    def place_mark(pos, mark)
        row = pos[0]
        col = pos[1]
        if @grid[row][col] = "_" 
            @grid[row][col] = mark
            return true
        else
            raise "Occupied. Choose another"
            return false
        end
    end

    def print
        @grid.each do |row|
            p row
        end
    end
    
    def win_row?(mark) # :X
        @grid.each do |row|
            if !row.include?("_") && row.uniq.length == 1 && row[0] == mark
                return true
            end
        end

        false                
    end

    def win_col?(mark)
        transposed = (0...@grid.length).map do |i| # []
            @grid.map do |row|
                row[i]
            end
        end

        transposed.each do |row|
            if !row.include?("_") && row.uniq.length == 1 && row[0] == mark
                return true
            end
        end

        false  
    end

    def win_diagonal?(mark)
        forwards = (0...@grid.length).map { |i| @grid[i][i] }
        backwards = (0...@grid.length).map { |i| @grid[i][-i - 1] }
        forwards.uniq.length == 1 && !forwards.include?("_") && forwards[0] == mark || backwards.uniq.length == 1 && !backwards.include?("_") && backwards[0] == mark
    end

    def win?(mark)
        if win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
            return true
        else
            return false
        end
    end

    def empty_positions?
        @grid.each do |row|
            return true if row.include?("_")
        end
        false
    end

end