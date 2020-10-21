# blackjack_score.rb
# ("Jack", "Queen", "King") have a value of 10.
# Aces (1) can have a value of either 1 or 11, whichever will get the hand closest to 21 without going over.
# A hand, an array of Card values, must be between 2 and 5 items inclusive.
VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  score = 0

  if hand.length > 5 || hand.length < 2
    raise ArgumentError.new("#must be between 2 and 5 items")
  end

  ace_count = 0

  hand.each do |card|

    case card
    when "Jack", "Queen", "king"
      card = 10
    when "Ace"
      card = 1
      ace_count += 1
    when (2..9)
      card = card
    else
      raise ArgumentError.new("invalid #{card}")
    end
    score += card
  end

  while score <= 11 && ace_count > 0
    score += 10
    ace_count -= 1
  end

  if score <= 21
    return score
  else
    raise ArgumentError.new("score is over 21")
  end
end

