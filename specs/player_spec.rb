require('minitest/autorun')
require('minitest/rg')
require_relative('../player')

class TestPlayer < MiniTest::Test
  def test_player_has_name
    @player = Player.new("Maximus")
    assert_equal('Maximus',@player.name)
  end

  def test_player_has_starting_lives
    @player = Player.new("Maximus")
    assert_equal(6,@player.lives)
  end

  def test_player_can_lose_a_life
    @player = Player.new("Maximus")
    assert_equal(5,@player.lose_life)
  end
end
