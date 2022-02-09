require_relative "code"

class Mastermind

    def initialize(l)
        @secret_code = Code.random(l)
    end

    def print_matches(code) # Code
        puts "Exact matches: #{@secret_code.num_exact_matches(code)}"
        puts "Near matches: #{@secret_code.num_near_matches(code)}"
    end
    
    def ask_user_for_guess
        p "Enter a code"
        user_g = Code.from_string(gets.chomp)
        print_matches(user_g)
        user_g == @secret_code
    end
end
