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
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7

  end

  it 'face cards have values calculated correctly' do

    # Arrange
    hand = [3, "King"]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 13

  end

  it 'face cards have values calculated correctly' do

    # Arrange
    hand = [3, "Queen"]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 13

  end

  it 'face cards have values calculated correctly' do

    # Arrange
    hand = [3, "Jack"]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 13

  end


  it 'calculates aces as 11 where it does not go over 21' do

    score = blackjack_score(["Ace", 4])
    expect(score).must_equal 15

    score = blackjack_score(["Ace", "Jack"])
    expect(score).must_equal 21

    score = blackjack_score(["Ace", 4, 1])
    expect(score).must_equal 16

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

    score = blackjack_score(["Ace", 3, "King"])
    expect(score).must_equal 14

  end

  it 'raises an ArgumentError for invalid cards' do


  end

  it 'raises an ArgumentError for scores over 21' do


  end
end
