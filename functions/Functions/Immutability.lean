namespace Immutability
-- Defining a value to have a name via def makes it immutable.
-- You can redefine things again.

def number := 2
-- def number := 3

-- This is max definition of mutablility which you can have in Lean
initialize otherNumber : IO.Ref Nat ←
  IO.mkRef (2)

end Immutability
