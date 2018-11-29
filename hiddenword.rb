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

  def display(guessed_letters)


    @word_to_display = obfuscate()

    # Iterate through each character in the unobfuscated @word and check to see if
    # each character matches and return an array of matching indexes.

    index_counter = 0
    indexes_to_sub = []

    @word.each_char {|char|
        indexes_to_sub << index_counter if guessed_letters.include?(char)
        index_counter += 1
    }
    # Map letters from original word to obfuscated word.

    indexes_to_sub.each { |index| @word_to_display[index] = @word[index]
    }

    return @word_to_display
  end
end
