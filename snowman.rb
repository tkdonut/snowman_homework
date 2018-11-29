require_relative('./game')
require_relative('./hiddenword')
require_relative('./player')
system('clear')

#Splash screen

puts ''
puts ''
puts '   .d8888b.                                                                  '
puts '  d88P  Y88b                                                                 '
puts '  Y88b.                                                                      '
puts '   "Y888b.   88888b.   .d88b.  888  888  888 88888b.d88b.   8888b.  88888b.  '
puts '      "Y88b. 888 "88b d88""88b 888  888  888 888 "888 "88b     "88b 888 "88b '
puts '        "888 888  888 888  888 888  888  888 888  888  888 .d888888 888  888 '
puts '  Y88b  d88P 888  888 Y88..88P Y88b 888 d88P 888  888  888 888  888 888  888 '
puts '   "Y8888P"  888  888  "Y88P"   "Y8888888P"  888  888  888 "Y888888 888  888 '
puts ''
puts ''
print "            \"It's definately not hangman\" - anon"
puts ''
puts ''
puts ''

#Game set up prompts

print '  What would you like to be called? '
name = gets.chomp
puts ''
print "  Ok #{name}, now enter a secret word or phrase:  "
word = gets.chomp
while word == ''
  puts ''
  print '  I need a word! Try again: '
  word = gets.chomp
end
@hiddenword = HiddenWord.new(word)
@player = Player.new(name)
@game = Game.new(@player,@hiddenword)

# Main loop

while true
  system('clear')
  puts ''
  puts ''
  print '  Lives remaining:  '
  @player.lives.times do
    print '  ❤'
  end
  puts ''
  puts ''
  if @game.guessed_letters.length > 0
    print '  Characters tried: '
    @game.guessed_letters.each do |letter|
      print(' ' + letter)
    end
  end
  puts ''
  puts ''
  puts '  Word:      ' + @hiddenword.display(@game.guessed_letters)
  puts ''
  print '  Guess a character : '
  @game.make_guess(gets.chomp)

  if @game.is_won? == true
    system('clear')
    puts ""
    puts ""
    puts "  Nicely done #{@player.name}!  A winner is you !    "
    puts ""
    break
  elsif @game.is_lost? == true
    system('clear')
    puts ""
    puts ""
    puts "  Sorry #{@player.name}, the answer was #{@hiddenword.word}. **Sad trombone**"
    puts ""
    break
  end
end
