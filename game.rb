class Game
  attr_reader :guessed_letters

  def initialize(player,hiddenword)
    @player = player
    @hiddenword = hiddenword
    @guessed_letters=[]
  end

  def make_guess(guess)

    if guess.length != 1 || @guessed_letters.include?(guess)
      return
    elsif @hiddenword.is_in_secret?(guess) == false
      @guessed_letters << guess
      @player.lose_life()

    else
      @guessed_letters << guess
    end
  end

  def is_won?()
    @hiddenword.display(guessed_letters) == @hiddenword.word
  end

  def is_lost?()
    @player.lives == 0
  end
end
