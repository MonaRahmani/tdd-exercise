require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    # hand = [3, 4]

    # Act
    score = blackjack_score([3, 4])

    # Assert
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do

    # Act
    score = blackjack_score([2, 5, 3])

    # Assert
    expect(score).must_equal 10

  end

  it 'calculates aces as 11 where it does not go over 21' do


    # Arrange
    score = blackjack_score([2, 3, 'Ace'])

    # Assert
    expect(score).must_equal 16

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do


    # Arrange
    score = blackjack_score([5, 9, 3, 'Ace'])

    # Assert
    expect(score).must_equal 18

  end

  it 'raises an ArgumentError for invalid cards' do


    expect {
      blackjack_score('King', 'h', 5)
    }.must_raise ArgumentError


    expect {
      blackjack_score([5, 13])
    }.must_raise ArgumentError

  end


  it 'raises an ArgumentError for scores over 21' do

    expect {
      blackjack_score([6, 7, 8, 9])
    }.must_raise ArgumentError


    expect {
      blackjack_score([6, 7, 8, 'Ace'])
    }.must_raise ArgumentError

  end

  it 'does not accept hands smaller than 2 or greater than 5' do

    expect {
      blackjack_score([2, 3, 'Ace', 9, 'King', 4])
    }.must_raise ArgumentError


    expect {
      blackjack_score([2])
    }.must_raise ArgumentError

  end

end