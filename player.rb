class Player
  attr_reader :name
  attr_accessor :score, :lives
  def initialize(name, score = 0, lives = 3)
    @name = name
    @score = score
    @lives = lives
  end
  def subtract_life
    @lives -= 1
  end
  def plus_score
    @score += 1
  end
end