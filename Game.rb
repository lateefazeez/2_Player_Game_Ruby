require './Player'

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

    @current_player = @players[0]

    while(@current_player.lives > 0)
      play_round
    end

    def update_rounds
    end

    def switch_player
    end

    def play_round

    end

    def end_game
    end


    @current_player = 