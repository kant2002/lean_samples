import Datatypes
open Tuples
open Lists

def main : IO Unit := do
  -- Tuples --
  IO.println s!"The result of swapping (1, 2) is {(swapElems (1,2))}"
  IO.println s!"tuple1: {tuple1}\ttuple2: {tuple2}"

  -- Lists --
