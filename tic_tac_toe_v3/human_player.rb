# require "byebug"
class HumanPlayer

    attr_reader :mark_val

    def initialize(mark_val)
        @mark_val = mark_val
    end

    def get_position(legal_pos)
        validity = false

        while !validity
            validity = true

            p "Enter position as two digits separated by a space i.e. '0 2'"
            str = gets.chomp # "4 5"
            pos = str.split(" ").map(&:to_i) # [4, 5]

            if legal_pos.include?(pos)
                return pos
            else
                p "not valid dummy"
                validity = false
            end
        end
        
    end

end

