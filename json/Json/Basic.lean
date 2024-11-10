import Lean.Data.Json

-- You can define Json-like structure using embedded syntax.
-- that syntax completely defined in Lean4.
-- You can embed some calculations inside the node
def jsonLiteral := json% {
    hello : "world",
    cheese : ["edam", "cheddar", {kind : "spicy", rank : 100.2}],
    lemonCount : 100e30,
    isCool : true,
    isBug : null,
    lookACalc: $(23 + 54 * 2),
    lookAListCalc: $([1,2,3])
  }

-- Getting property by name and extraction of value
def cheese := (jsonLiteral.getObjVal? "cheese").bind Lean.Json.getArr?

def parseFromString :=
  Lean.Json.parse "[1,2, {\"data\":132}]"
