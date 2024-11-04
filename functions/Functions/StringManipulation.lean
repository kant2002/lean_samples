namespace StringManipulation
-- Strings use double quotes.
def string1 : String := "Hello"
def string2  := "world"

-- Strings can also use r## to create a raw string literal.
-- This will ignore escape characters such as '\', '\n', '\t', etc.
def string3 := r"C:\Program Files\"

-- String literals can also use r## to escape # inside raw stings.
def string4 := r##"No # will escape prison of raw literals!"##

-- String concatenation is normally done with the '++' operator.
def helloWorld := string1 ++ " " ++ string2

-- Substrings use the indexer notation.  This line extracts the first 7 characters as a substring.
-- Note that like many languages, Strings are zero-indexed in F#.
def substring := helloWorld.extract ⟨0⟩ ⟨6⟩

end StringManipulation
