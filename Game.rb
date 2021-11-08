require './Player'
require './Question'

class Game

  attr_reader :round, :current_player
  
  # define the constructor method with initial values
  def initialize
    @current_player = nil
    @players = []
    @round = 0
  end

  # start the game and looping rounds
  def play_game

    player1 = Player.new('player1')
    @players << player1

    player2 = Player.new('player2')
    @players << player2

    @current_player = @players[1]

    while(@current_player.lives > 0)
      play_round
    end

    end_game
  end

  def update_rounds
    @round += 1
  end

  def switch_player
    if (@current_player == @players[0])
      @current_player = @players[1]
    else
      @current_player = @players[0] 
    end
  end

  def play_round

    update_rounds
    switch_player

    question = Question.new()
    puts "#{@current_player.name}: #{question.print_question} "
    puts "> "
    answer = gets.chomp.to_i

    if (question.right_answer?(answer))
      puts "#{@current_player.name}: YES! You are correct."
      puts "P1: #{@players[0].lives}/3} vs P2: #{@players[1].lives}/3}"
      puts "-------------NEW TURN-------------"
    
    else
      puts "#{@current_player.name}: Seriously? No!."
      @current_player.update_lives
      puts "P1: #{@players[0].lives}/3} vs P2: #{@players[1].lives}/3}"
      if (@current_player.lives > 0)
        puts "-------------NEW TURN--------------"
      end
    end
  end

  def end_game
    puts "-------------GAME OVER-------------"
    switch_player
    puts "#{@current_player.name} wins with a score of #{@current_player.lives}/3"
    puts "Good bye!"
  end


end

