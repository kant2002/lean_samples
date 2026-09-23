namespace StringManipulation
-- Strings use double quotes.
def string1 : String := "Hello"
def string2  := "world"

-- Strings can also use r## to create a
-- raw string literal.
-- This will ignore escape characters
-- such as '\\', '\n', '\t', etc.
def string3 := r"C:\Program Files\"

-- String literals can also use r## to
-- escape # inside raw stings.
def string4 :=
  r##"No # will escape prison of raw literals!"##

-- String concatenation is
-- usually done with the '++' operator.
def helloWorld :=
  string1 ++ " " ++ string2

-- Substrings use the indexer notation.
-- This line extracts the first 7 characters as a substring.
-- Note that like many languages,
-- Strings are zero-indexed in Lean.
-- Position in Lean is index and proof of bounds.
-- there special thing as start position (which can be accessed using .startPos).
-- For construction of deliberate position, I use sorry which is obviosuly a not good practice.
-- But don't think that making real proof for helper strings is practical.
def substring :=
  helloWorld.extract helloWorld.startPos (helloWorld.pos! ⟨6⟩)

-- Here we safely get the position as an option.
def off := helloWorld.pos? ⟨6⟩
def substring2 :=
  off.map (fun o => helloWorld.extract helloWorld.startPos o)

-- Slice is different from substring. It is string + start index + end index + proof that start is less then end.
-- Slice does not create new string as extract does.
def slice := helloWorld.slice helloWorld.startPos (helloWorld.pos! ⟨6⟩)

def removedWhitespaces := helloWorld.trimAscii

end StringManipulation
