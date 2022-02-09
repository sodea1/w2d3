require_relative "./board.rb"

class ComputerPlayer 

    attr_reader :mark_val

    def initialize(mark_val)
        @mark_val = mark_val
    end

    def get_position(legal_pos)
        pos = legal_pos.sample
        p "Computer #{mark_val} chose position #{pos}"
        pos
        

        # p "Enter position as two digits separated by a space i.e. '0 2'"
        # pos = gets.chomp.split(" ").map(&:to_i)

        # if pos.length != 2
        #     raise "Invalid guess"
        # else
        #     pos
        # end
        
    end


end