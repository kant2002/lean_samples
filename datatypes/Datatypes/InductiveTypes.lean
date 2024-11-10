-- You can think about inductive types as some form of tagged unions.
-- That's a lie, but it helps you get started and do not think too
-- much about mathematics initially. But don't forget that it's a lie, and
-- when it hits you dig deeper.

-- The following represents the suit of a playing card.
inductive Suit where
  | Hearts : Suit
  | Clubs : Suit
  | Diamonds : Suit
  | Spades : Suit

-- A inductive type can also be used to represent the rank of a playing card.
inductive Rank where
  -- Represents the rank of cards 2 .. 10
  | Value : Nat → Rank
  | Ace
  | King
  | Queen
  | Jack

-- inductive type can also implement members.
def Rank.GetAllRanks :=
  [ Rank.Ace,
    Rank.Value 2,
    Rank.Value 3,
    Rank.Value 4,
    Rank.Value 5,
    Rank.Value 6,
    Rank.Value 7,
    Rank.Value 8,
    Rank.Value 9,
    Rank.Value 10,
    Rank.Jack,
    Rank.Queen,
    Rank.King ]

-- This is a record type that combines a Suit and a Rank.
-- It's common to use both Records and Discriminated Unions when representing data.
structure Card where
  Suit: Suit
  Rank: Rank

-- This computes a list representing all the cards in the deck.
def flatten : List (List α) → List α
  | []      => []
  | a :: as => a ++ flatten as

def fullDeck :=
  let suitAndRanks :=
    [ Suit.Hearts, Suit.Diamonds, Suit.Clubs, Suit.Spades ].map
      (fun suit => Rank.GetAllRanks.map (fun rank => (suit, rank)))
  (flatten suitAndRanks).map (fun (suit, rank) => Card.mk suit rank)

-- This example converts a 'Card' object to a string.
def showPlayingCard (c: Card) :=
  let rankString :=
    match c.Rank with
    | .Ace => "Ace"
    | .King => "King"
    | .Queen => "Queen"
    | .Jack => "Jack"
    | .Value n => String.mk (Nat.toDigits 10 n)
  let suitString :=
    match c.Suit with
    | .Clubs => "clubs"
    | .Diamonds => "diamonds"
    | .Spades => "spades"
    | .Hearts => "hearts"
  rankString ++ " of " ++ suitString

-- This example prints all the cards in a playing deck.
def printAllCards : IO Unit :=
  for card in fullDeck do
    IO.println s!"{showPlayingCard card}"
