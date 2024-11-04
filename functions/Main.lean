import Functions
open BasicFunctions

def main : IO Unit := do
  -- There no separate formatting functions.
  -- Lean rely on ToString typeclass to be defined for
  -- the interpolated object. That type class contains toString function
  IO.println s!"The result of squaring the integer 4573 and adding 3 is {result1}"

  IO.println s!"The result of applying the 2nd sample function to (7 + 4) is {result2}"
  IO.println s!"The result of applying the 3rd sample function to (6.5 + 4.5) is {result3}"
