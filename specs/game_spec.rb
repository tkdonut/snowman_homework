require('minitest/autorun')
require('minitest/rg')
require_relative('../game')
require_relative('../player')
require_relative('../hiddenword')

class TestGame < MiniTest::Test

  def setup
     @player = Player.new('Tom')
     @hiddenword = HiddenWord.new('banana')
     @game = Game.new(@player,@hiddenword)
  end

  def test_make_guess__charpresent
    @game.make_guess('a')
    assert_equal(['a'],@game.guessed_letters)
  end

  def test_make_guess__charpresent__didnt_lose_a_life
    @game.make_guess('c')
    assert_equal(5,@player.lives)
  end


  def test_make_guess__not_present__is__added
    @game.make_guess('c')
    assert_equal(['c'],@game.guessed_letters)
  end

  def test_make_guess__not_present__lost_a_life
    @game.make_guess('c')
    assert_equal(5,@player.lives)
  end

  def test_make_guess__present
    @game.make_guess('a')
    @game.make_guess('a')
    assert_equal(['a'],@game.guessed_letters)
  end

  def test_game_is_won__correct_guesses
    @game.make_guess('b')
    @game.make_guess('a')
    @game.make_guess('n')
    assert_equal(true,@game.is_won?)
  end

  def test_game_is_won__incorrect_guesses
    @game.make_guess('8')
    @game.make_guess('z')
    @game.make_guess('5')
    assert_equal(false,@game.is_won?)
  end

  def test_game_is_lost__1_badguess
    assert_equal(false,@game.is_lost?)
  end

  def test_game_is_lost__5_badguesses
    @game.make_guess('1')
    @game.make_guess('2')
    @game.make_guess('3')
    @game.make_guess('4')
    @game.make_guess('5')

    assert_equal(false,@game.is_lost?)
  end

  def test_game_is_lost__6_badguesses
    @game.make_guess('1')
    @game.make_guess('2')
    @game.make_guess('3')
    @game.make_guess('4')
    @game.make_guess('5')
    @game.make_guess('6')
    assert_equal(true,@game.is_lost?)
  end


  def test_game_is_lost__5_badguesses_with_goodguesses
    @game.make_guess('1')
    @game.make_guess('2')
    @game.make_guess('a')
    @game.make_guess('3')
    @game.make_guess('b')
    @game.make_guess('4')
    @game.make_guess('5')
    assert_equal(false,@game.is_lost?)
  end

end
