class RPS
  def initialize
    @p1_counter = 0
    @p2_counter = 0
  end

  #validates user input
  def valid?(move)
    valid_answers = ["rock", "paper", "scissors","score"]
    valid = false
      while valid != true
        if move == @player1_move
          unless valid_answers.include?(@player1_move)
            puts "Please enter a valid input, ROCK, PAPER, or SCISSORS. Also, type in SCORE to view the current score."
            @player1_move = gets.chomp.downcase
          end
          valid = true
        else
          unless valid_answers.include?(@player2_move)
            puts "Please enter a valid input, ROCK, PAPER, or SCISSORS."
            @player2_move = gets.chomp.downcase
          end
          valid = true
        end
      end
  end

  #returns current score
  def score?(move)
    if move == "score"
      puts "The current score is #{@p1_counter} to #{@p2_counter}. Please enter in your next move."
      @player1_move = gets.chomp.downcase
    end
  end

  #prompts users to start the game
  def prompt_game
    while @p1_counter < 2 && @p2_counter < 2
      puts "Player One, enter your move: ROCK, PAPER, or SCISSORS (Extra: Type in SCORE to view the current score)."
      @player1_move = gets.chomp.downcase
      50.times {puts}
      #checks validity of user input
      valid?(@player1_move)
      #outputs the current score to the user
      score?(@player1_move)

      puts "Player Two, enter your move: ROCK, PAPER, or SCISSORS."
      @player2_move = gets.chomp.downcase
      #checks validity of user input
      valid?(@player2_move)

      #starts the game!
      decision(@player1_move,@player2_move)
    end

    if @p1_counter > @p2_counter
      puts "Player One is the winner!"
    elsif @p1_counter < @p2_counter
      puts "Player Two is the winner!"
    end
  end


  #determines which player wins a game & match
  def decision(p1,p2)
      #returns score of current game
      if p1 == "score" || p2 == "score"
        puts "The score is #{@p1_counter} to #{@p2_counter}."
      end
      #gameflow
      if p1 == p2
        puts "TIE game, the score is still #{@p1_counter} to #{@p2_counter}."
      elsif p1 == "rock"
        if p2 == "scissors"
          @p1_counter += 1
          puts "Player One wins, the score is #{@p1_counter} to #{@p2_counter}."
        elsif p2 == "paper"
          @p2_counter += 1
          puts "Player Two wins, the score is #{@p1_counter} to #{@p2_counter}."
        end
      elsif p1 == "paper"
        if p2 == "rock"
          @p1_counter += 1
          puts "Player One wins, the score is #{@p1_counter} to #{@p2_counter}."
        elsif p2 == "scissors"
          @p2_counter +=1
          puts "Player Two wins, the score is #{@p1_counter} to #{@p2_counter}."
        end
      elsif p1 =="scissors"
        if p2 == "rock"
          @p2_counter += 1
          puts "Player Two wins, the score is #{@p1_counter} to #{@p2_counter}."
        elsif p2 == "paper"
          @p1_counter += 1
          puts "Player One wins, the score is #{@p1_counter} to #{@p2_counter}."
        end
      end
  end
end

new_game = RPS.new
new_game.prompt_game


