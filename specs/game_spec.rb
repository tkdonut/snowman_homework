require('minitest/autorun')
require('minitest/rg')
require_relative('../game')
require_relative('../player')
require_relative('../hiddenword')

class TestGame < MiniTest::Test

  def setup
    p @player = Player.new('Tom')
    p @hiddenword = HiddenWord.new('banana')
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

end
