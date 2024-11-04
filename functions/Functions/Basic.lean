namespace BasicFunctions
  -- You use 'def' to define a function.
  -- This one accepts an natural number argument and returns an integer.
  -- Parentheses are optional for function arguments,
  -- except for when you use an explicit type annotation.
  def sampleFunction1 x := x*x + 3

  def result1 := sampleFunction1 4573

  -- When needed, annotate the type of a parameter name using '(argument:type)'.  Parentheses are required.
  -- In comparison to other programming languages, Lean4 is lacking.
  -- You can have Nat, Int, UInt8, UInt16, UInt32, UInt64.
  -- As you can see, there no signed counterparts,
  -- and Int is magical type which change it's underlying storage as it see fit.
  def sampleFunction2 (x: Int) := 2*x*x - x/5 + 3

  def result2 := sampleFunction2 (7 + 4)

  def sampleFunction3 x :=
      if x < 100.0 then
          2.0*x*x - x/5.0 + 3.0
      else
          2.0*x*x + x/5.0 - 37.0

  def result3 := sampleFunction3 (6.5 + 4.5)

end BasicFunctions
