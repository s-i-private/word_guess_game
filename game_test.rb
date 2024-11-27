require 'minitest/autorun'
require_relative 'game'

class TestWordGuessGame < Minitest::Test
  def setup
    @game = WordGuessGame.new
    @game.instance_variable_set(:@word, "apple") # テスト用に単語を固定
  end

  def test_initial_state
    assert_equal "_____", @game.display_word
    assert_equal 5, @game.remaining_attempts
  end

  def test_correct_guess
    @game.guess('a')
    assert_equal "a____", @game.display_word
    assert_equal 5, @game.remaining_attempts
  end

  def test_incorrect_guess
    @game.guess('z')
    assert_equal "_____", @game.display_word
    assert_equal 4, @game.remaining_attempts
  end

  def test_case_insensitive_guess
    @game.guess('A')
    assert_equal "a____", @game.display_word
    assert_equal 5, @game.remaining_attempts
  end

  def test_invalid_input
    assert_equal false, @game.guess('1')
    assert_equal false, @game.guess('!')
    assert_equal false, @game.guess('aa')
  end

  def test_game_won
    "apple".chars.each { |char| @game.guess(char) }
    assert @game.won?
    refute @game.lost?
    assert @game.game_over?
  end

  def test_game_lost
    ["z", "y", "x", "w", "v"].each { |char| @game.guess(char) }
    refute @game.won?
    assert @game.lost?
    assert @game.game_over?
  end
end
