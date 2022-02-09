class Board

    attr_reader :size
  
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n 
    end

    def [](pos) # row, col
        row = pos[0]
        col = pos[1]
        @grid[row][col]
    end

    def []=(pos, val)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = val
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p "you sunk my battleship!"
            true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        count = @size / 4

        while count > 0 
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            if @grid[row][col] != :S
                @grid[row][col] = :S
                count -= 1
            end
        end

    end

    def hidden_ships_grid
        @grid.map.with_index do |row, i1| # []
            row.map.with_index do |col, i2| # []
                if @grid[i1][i2] == :S
                    :N
                else
                    @grid[i1][i2]
                end
            end
        end

        # hidden = grid.map { |row| row.map { |ele| ele == :S ? ele = :N : ele } }
        
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board::print_grid(@grid)
    end

    def print
        Board::print_grid(self.hidden_ships_grid)
    end

end
