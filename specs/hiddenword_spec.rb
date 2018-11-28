require('minitest/autorun')
require('minitest/rg')
require_relative('../hiddenword')

class HiddenWordTest < MiniTest::Test

  def test_hiddenword_has_word
    @hiddenword = HiddenWord.new('banana')
    assert_equal('banana',@hiddenword.secret)
  end

end
