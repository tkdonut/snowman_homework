require('minitest/autorun')
require('minitest/rg')
require_relative('../game.rb')

class TestGame < MiniTest::Test

  def setup
    @game = Game.new(@player,@hiddenword)
    @player = Player.new('Tom')
    @hiddenword  = HiddenWord.new('banana')
  end

end
