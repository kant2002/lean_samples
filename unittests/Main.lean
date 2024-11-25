import Unittests

def main : IO Unit :=
  for i in List.range' 1 50 do
    IO.println (⟨Nat.toDigits 10 i⟩ ++ " - " ++ (fizzbuzz i))
