require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"
require "byebug"

class Game 

    attr_reader :board, :current_p #, :p_one, :p_two

    def initialize(size, players) # mark: t/f
        # @p_one = HumanPlayer.new(p_one)
        # @p_two = HumanPlayer.new(p_two)
        @players = []
        players.each do |k, v|
            if !v
                @players << HumanPlayer.new(k)
            else
                @players << ComputerPlayer.new(k)
            end
        end

        @current_p = @players[0]
        @board = Board.new(size)
    end

    def switch_turn
        @players = @players.rotate
        @current_p = @players[0]
        # if @current_p == @p_one
        #     @current_p = @p_two
        # else
        #     @current_p = @p_one
        # end
    end

    def play
        
        while board.empty_positions?
            @board.print
            valid = false

            while !valid
                valid = true
                pos = current_p.get_position(@board.legal_positions) # [1, 1]

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

        p @board.print
        p "Draw"
    end

end
