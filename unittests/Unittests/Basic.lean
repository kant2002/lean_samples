/-
Given an integer n, for every positive integer i <= n, the task is to print,

“FizzBuzz” if value is divisible by 3 and 5,
“Fizz” if value is divisible by 3,
“Buzz” if value is divisible by 5
“value” as a string, if none of the conditions are true.
-/

def fizzbuzz (value: Nat) :=
  if value % 15 = 0 then
    "FizzBuzz"
  else if value % 3 = 0 then
    "Fizz"
  else if value % 5 = 0 then
    "Buzz"
  else
    ⟨Nat.toDigits 10 value⟩
