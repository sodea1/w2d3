require_relative "./board.rb"
require_relative "./human_player.rb"
require "byebug"

class Game 

    attr_reader :board, :current_p #, :p_one, :p_two

    def initialize(p_one, p_two) # (:0, :X)
        @p_one = HumanPlayer.new(p_one)
        @p_two = HumanPlayer.new(p_two)
        @current_p = @p_one
        @board = Board.new
    end

    def switch_turn
        if @current_p == @p_one
            @current_p = @p_two
        else
            @current_p = @p_one
        end
    end

    def play
        
        while board.empty_positions?
            @board.print
            valid = false

            while !valid
                valid = true
                pos = current_p.get_position # [1, 1]

                if @board.empty?(pos) && @board.valid?(pos)
                    @board.place_mark(pos, current_p.mark_val)
                else
                    p "Invalid guess"
                    valid = false
                end

            end
                
            
            if @board.win?(current_p.mark_val)
                p "Victory! Player #{current_p.mark_val} wins!"
                return true
            else
                self.switch_turn
            end
            
        end

        
        p "Draw"
    end

end
