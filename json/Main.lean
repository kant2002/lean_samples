import Json
import Lean.Data.Json

def main : IO Unit := do
  IO.println s!"{jsonLiteral}"

  IO.println s!"cheese property: {cheese.toOption.get!}"

  IO.println s!"Pretify: {Lean.Json.pretty jsonLiteral 30}"
  IO.println s!"Parsed value from string {parseFromString}"
