require('minitest/autorun')
require('minitest/rg')
require_relative('../hiddenword')

class HiddenWordTest < MiniTest::Test

  def test_hiddenword_has_word
    @hiddenword = HiddenWord.new('banana')
    assert_equal('banana',@hiddenword.word)
  end

  def test_obfuscates_word__word
    @hiddenword = HiddenWord.new('banana')
    assert_equal("******",@hiddenword.obfuscate)
  end

end
