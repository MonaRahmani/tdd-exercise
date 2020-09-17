# blackjack_score.rb
# ("Jack", "Queen", "King") have a value of 10.
# Aces (1) can have a value of either 1 or 11, whichever will get the hand closest to 21 without going over.
# A hand, an array of Card values, must be between 2 and 5 items inclusive.
VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)

  #ArgumentError for length
  if hand.length > 5 || hand.length < 2
    raise ArgumentError.new("#must be between 2 and 5 items")
  end

  #ArgumentError for invalid item
  hand.each do |item|
    unless VALID_CARDS.include?(item)
      raise ArgumentError.new("invalid value")
    end
  end


  blackjack_score = 0
  ace_arr = []

  hand.each do |item|
    case item
    when "Jack"
      blackjack_score += 10
    when "Queen"
      blackjack_score += 10
    when "King"
      blackjack_score += 10
    when 2, 3, 4, 5, 6, 7, 8, 9, 10
      blackjack_score += item
    when item == "Ace"
      ace_arr << item
    end
  end

  #handeling Ace case
  ace_arr.each do
    if blackjack_score <= 10
      blackjack_score += 11
    else
      blackjack_score += 1
    end
  end

  #ArgumentError for score over 21
  if blackjack_score > 21
    raise ArgumentError.new("#{blackjack_score} is larger than 21")
  end
    return blackjack_score
end

