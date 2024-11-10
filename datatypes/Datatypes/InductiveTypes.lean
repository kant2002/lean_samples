-- You can think about inductive types as some form of tagged unions.
-- That's a lie, but it helps you get started and do not think too
-- much about mathematics initially. But don't forget that it's a lie, and
-- when it hits you dig deeper.

-- The following represents the suit of a playing card.
-- Lean4 call this simple form Enumerated types
inductive Suit where
  | Hearts : Suit
  | Clubs : Suit
  | Diamonds : Suit
  | Spades : Suit

-- A inductive type can also be used to represent the rank of a playing card.
-- This is more generic version, which allow attach
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

-- Single-case inductive types can be used for domain modeling.
-- This can buy you extra type safety
-- over primitive types such as strings and ints.
--
-- Single-case inductive types cannot be implicitly converted to or from the type they wrap.
-- For example, a function which takes in an Address cannot accept a string as that input,
-- or vice versa.
inductive Address where | Address : String → Address
inductive Name where | Name : String → Name
inductive SSN where | SSN : Nat → SSN

-- You can easily instantiate a single-case DU as follows.
def address := Address.Address "111 Alf Way"
def name := Name.Name "Alf"
def ssn := SSN.SSN 1234567890

-- When you need the value, you can unwrap the underlying value with a simple function.
def unwrapAddress (a: Address) := match a with | Address.Address a => a
def unwrapName (n: Name) := match n with | Name.Name n => n
def unwrapSSN (s: SSN) := match s with | SSN.SSN s => s

-- Discriminated Unions also support recursive definitions.
--
-- This represents a Binary Search Tree, with one case being the Empty tree,
-- and the other being a Node with a value and two subtrees.
--
-- Note 'T here is a type parameter, indicating that 'BST' is a generic type.
-- More on generics later.
inductive BST (α : Type u) where
  | Empty
  | Node (key: Nat) (value: α) (left: BST α) (right: BST α) : BST α

-- Check if an item exists in the binary search tree.
-- Searches recursively using Pattern Matching.  Returns true if it exists; otherwise, false.
def BST.exists (bst: BST α) (item: Nat) :=
  match bst with
  | Empty => false
  | Node key val left right =>
      if item < key then left.exists item -- Check the left subtree.
      else if item > key then right.exists item -- Check the right subtree.
      else true

-- Inserts an item in the Binary Search Tree.
-- Finds the place to insert recursively using Pattern Matching, then inserts a new node.
-- If the item is already present, it does not insert anything.
def BST.insert (bst: BST α) (k: Nat) (item: α) :=
  match bst with
    | Empty => Node k item Empty Empty
    | Node key x left right =>
        if k < key then Node k x (left.insert k item) right -- Call into left subtree.
        else if k > key then BST.Node k x left (right.insert k item) -- Call into right subtree.
        else BST.Node k x left right -- No need to insert, it already exists; return the node.
