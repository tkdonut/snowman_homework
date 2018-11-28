class HiddenWord
  attr_reader :word
  def initialize(word)
    @word = word
  end

  def obfuscate
    return @word.gsub(/[^\s]/,'*')
  end

  def is_in_secret?(char)
    return @word.include?(char)
  end

end
