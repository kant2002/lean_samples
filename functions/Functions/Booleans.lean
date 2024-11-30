namespace Booleans
-- Booleans values are
-- 'true' and 'false' as in regular languages
def boolean1 := true
def boolean2 := false

-- Operators on booleans are
-- 'not', '&&' and '||'.
def boolean3 :=
  not boolean1
  && (boolean2 || false)

end Booleans
