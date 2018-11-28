class HiddenWord
  attr_reader :word
  def initialize(word)
    @word = word
  end

  def obfuscate
      @word.gsub(/[^\s]/,'*')
  end
end
