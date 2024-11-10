import Datatypes
open Tuples
open Lists

def main : IO Unit := do
  -- Tuples --
  IO.println s!"The result of swapping (1, 2) is {(swapElems (1,2))}"
  IO.println s!"tuple1: {tuple1}\ttuple2: {tuple2}"

  -- Lists --
  IO.println s!"The sum of the squares of numbers up to 1000 that are divisible by 3 is: {sumOfSquares}"

  -- StructureTypes --
  IO.println s!"Alf's Contact Card: {showContactCard contact1}"
  -- Members are accessed via the '.' operator on an instantiated type.
  IO.println s!"Alf's alternate contact card is {contactAlternate.PrintedContactCard}"

  -- Inductive types --
  printAllCards
