require 'set'

class WordGuessGame
  attr_reader :word, :remaining_attempts, :guessed_letters

  def initialize
    @word_list = %w[apple orange banana grape cherry peach mango lemon melon berry]
    @word = @word_list.sample.downcase
    @remaining_attempts = 5
    @guessed_letters = Set.new
  end

  def display_word
    @word.chars.map { |char| @guessed_letters.include?(char) ? char : '_' }.join
  end

  def guess(letter)
    letter = letter.downcase
    return false unless letter.match?(/^[a-z]$/)

    if @word.include?(letter)
      @guessed_letters.add(letter)
    else
      @remaining_attempts -= 1
    end
    true
  end

  def game_over?
    won? || lost?
  end

  def won?
    @word.chars.all? { |char| @guessed_letters.include?(char) }
  end

  def lost?
    @remaining_attempts <= 0
  end

  def correct_word
    @word
  end
end

if __FILE__ == $0
  game = WordGuessGame.new

  puts "英単語文字当てゲームを開始します。英単語のa-zから1文字だけ入力してください。"
  while !game.game_over?
    puts "今まで当てた文字: #{game.display_word}"
    puts "残り失敗可能数: #{game.remaining_attempts}"
    print "入力する文字: "
    input = gets.chomp

    if game.guess(input)
      puts "正解" if game.word.include?(input.downcase)
      puts "不正解" unless game.word.include?(input.downcase)
    else
      puts "無効な入力です。英単語のa-zから1文字だけ入力してください。"
    end
    puts "ーーーーーーーーーーーーーーーーー"
  end

  if game.won?
    puts "おめでとうございます。単語を当てました: #{game.correct_word}"
  else
    puts "ゲームオーバーです。正しい単語: #{game.correct_word}"
  end
end
