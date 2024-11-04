import Functions
open BasicFunctions
open Immutability
open IntegersAndNumbers
open Booleans
open StringManipulation

def main : IO Unit := do
  -- Basic functions ---

  -- There no separate formatting functions.
  -- Lean rely on ToString typeclass to be defined for
  -- the interpolated object. That type class contains toString function
  IO.println s!"The result of squaring the integer 4573 and adding 3 is {result1}"

  IO.println s!"The result of applying the 2nd sample function to (7 + 4) is {result2}"
  IO.println s!"The result of applying the 3rd sample function to (6.5 + 4.5) is {result3}"

  -- Immutability ---

  -- As you can see "mutability" is not pleasant
  -- You have to be inside some IO functions, and
  -- manually obtain values using ←
  IO.println s!"'otherNumber' is {← otherNumber.get}"
  otherNumber.set ((← otherNumber.get) + 1)
  IO.println s!"'otherNumber' changed to be {← otherNumber.get}"

  -- IntegersAndNumbers ---
  IO.println s!"The table of squares from 0 to 99 is:\n{sampleTableOfSquares}"

  -- Booleans ---
  IO.println s!"The expression 'not boolean1 && (boolean2 || false)' is {boolean3}"

  -- StringManipulation ---
  IO.println helloWorld
  IO.println string3
  IO.println string4
  IO.println s!"{substring}"
