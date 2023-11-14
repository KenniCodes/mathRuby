class Question
  attr_reader :answer
  def initialize
    @min_num = rand(1..20)
    @max_num = rand(1..20)
    @operator = ['/', '*', '-', '+'].sample
    @answer = @min_num.send(@operator, @max_num)
  end
  def to_s
    "Calculate #{@min_num} #{@operator} #{@max_num}?"
  end
end