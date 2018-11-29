require('minitest/autorun')
require('minitest/rg')
require_relative('../hiddenword')

class HiddenWordTest < MiniTest::Test

  def test_obfuscates_word__word
    @hiddenword = HiddenWord.new('banana')
    assert_equal("******",@hiddenword.obfuscate)
  end

  def test_obfuscates_word__phrase
    @hiddenword = HiddenWord.new('The rain in spain')
    assert_equal("*** **** ** *****",@hiddenword.obfuscate)
  end

  def test_obfuscates_word__contains_numbers
    @hiddenword = HiddenWord.new('2 Fast 2 Furious')
    assert_equal("* **** * *******",@hiddenword.obfuscate)
  end

  def test_obfuscates_word__contains_special_chars_and_numbers
    @hiddenword = HiddenWord.new('This clock is only £12!')
    assert_equal("**** ***** ** **** ****",@hiddenword.obfuscate)
  end

  def test_character_present__true
    @hiddenword = HiddenWord.new('apple')
    assert_equal(true,@hiddenword.is_in_secret?('a'))
  end

  def test_character_present__false
    @hiddenword = HiddenWord.new('apple')
    assert_equal(false,@hiddenword.is_in_secret?('z'))
  end

  def test_display__word
    @hiddenword = HiddenWord.new('apple')
    @guessed_letters = ['a','e']
    assert_equal('a***e',@hiddenword.display(@guessed_letters))
  end

  def test_display__phrase
    @hiddenword = HiddenWord.new('How now brown cow')
    @guessed_letters = ['o','w']
    assert_equal('*ow *ow **ow* *ow',@hiddenword.display(@guessed_letters))
  end

  def test_display__word
    @hiddenword = HiddenWord.new('apple')
    @guessed_letters = ['a','e']
    assert_equal('a***e',@hiddenword.display(@guessed_letters))
  end


end
