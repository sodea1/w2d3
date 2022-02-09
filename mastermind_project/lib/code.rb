class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |c| POSSIBLE_PEGS.has_key?(c.upcase) }
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "Invalid pegs"
    end

  end

  def self.random(l)
    keys = POSSIBLE_PEGS.keys
    randomized = []
    
    while l > 0
      randomized << keys.sample
      l -= 1
    end

    Code.new(randomized)
  end

  def self.from_string(str_pegs)
    pegs_arr = str_pegs.chars
    Code.new(pegs_arr)
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess) # guess = Code instance
    count = 0

    @pegs.each.with_index do |peg, i|
      if peg == guess[i]
        count += 1
      end
    end

    count
  end

  def num_near_matches(guess) # guess is a Code instance, so must "get" pegs i.e. Code.pegs to get an array of pegs
    try = guess.pegs
    code = @pegs.dup
    att = try.dup

    code.each.with_index do |peg, i|
      if peg == att[i]
        code[i] = nil
        att[i] = nil
      end
    end

    code.delete(nil)
    att.delete(nil)

    # R G B Code
    # G R R Att

    count = 0

    att.each.with_index do |ele, i|
      if code.include?(ele)
        count += 1
        code.delete_at(code.index(ele))
      end
    end

    count
  end

  def ==(code)
    self.pegs == code.pegs
  end

end
