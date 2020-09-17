require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    score = blackjack_score([3, 4])
    expect(score).must_equal 7

  end

  it 'face cards have values calculated correctly' do

    score = blackjack_score(["Queen", "King"])
    expect(score).must_equal 20

    score = blackjack_score(["king", "Jack"])
    expect(score).must_equal 20

  end

  it 'calculates aces as 11 where it does not go over 21' do

    score = blackjack_score(["Ace", 10])
    expect(score).must_equal 21

    score = blackjack_score(["Ace", "Jack"])
    expect(score).must_equal 21

    score = blackjack_score(["Ace", 9, 1])
    expect(score).must_equal 21

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

    score = blackjack_score(["Ace", 3, 7, "King"])
    expect(score).must_equal 21

    score = blackjack_score(["Ace", 5, "King"])
    expect(score).must_equal 16

    score = blackjack_score(["Ace", 3, "King"])
    expect(score).must_equal 14

  end

  it 'raises an ArgumentError for invalid cards' do

    # invalid card value
    expect {
      blackjack_score([30, "apple", "cat"])
    }.must_raise ArgumentError

    # hands contains more than 5 item
    expect {
      blackjack_score([1, 3, "King", 2, 4, 5])
    }.must_raise ArgumentError

    expect{
      blackjack_score([1])
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for scores over 21' do
    expect {
      blackjack_score([3, 10, "King"])
    }.must_raise ArgumentError

    expect {
      blackjack_score([9, 10, 3])
    }.must_raise ArgumentError

  end
end
