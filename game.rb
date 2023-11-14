require_relative 'player'
require_relative 'question'

class Game 
  def initialize
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @current_player = @player_1
  end
  def switch_turn
    @current_player = (@current_player == @player_1) ? @player_2 : @player_1
  end
  def begin
    until @player_1.lives.zero? || @player_2.lives.zero? do
      @question = Question.new
      puts "----- #{@current_player.name}'S TURN -----"
      puts "#{@current_player.name}, your question is: #{@question}"
      @player_answer = gets.chomp.to_i
      if @player_answer == @question.answer
        puts "#{@current_player.name}: ✔️ Correct! +1 to #{@current_player.name}'s current score"
        @current_player.plus_score
      else 
        puts "#{@current_player.name}: ✖️ Incorrect! -1 to #{@current_player.name}'s lives remaining. The answer should be #{@question.answer}"
        @current_player.subtract_life
      end
      puts "#{@player_1.name}: has #{@player_1.lives}/3 lives while #{@player_2.name}: has #{@player_2.lives}/3 lives"
      switch_turn
    end
    @winner = @player_1.lives > @player_2.lives ? @player_1 : @player_2
    puts "Congratulations #{@winner.name}! You won the game with a score of #{@winner.score} plus #{@winner.lives} lives remaining!"
    puts "---- END OF GAME -----"
  end
end
