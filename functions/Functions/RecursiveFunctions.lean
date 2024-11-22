namespace RecursiveFunctions

-- This example shows a recursive function that computes the factorial of an
-- integer. It uses 'let rec' to define a recursive function.
def factorial n :=
    if n = 0 then 1 else n * factorial (n-1)

-- Computes the greatest common factor of two integers.
--
-- Here Lean is a bit complicated. Let's say you want write greatest common
-- in trivial fashion. It would not work, since Lean cannot prove that this
-- function terminates with following error.
/-*
fail to show termination for
  RecursiveFunctions.greatestCommonFactor
with errors
failed to infer structural recursion:
Cannot use parameter a:
  failed to eliminate recursive application
    greatestCommonFactor a (b - a)
Cannot use parameter b:
  failed to eliminate recursive application
    greatestCommonFactor a (b - a)
*-/
-- def greatestCommonFactor (a: Nat) (b: Nat) :=
--     if a = 0 then b
--     else if a < b then greatestCommonFactor a (b - a)
--     else greatestCommonFactor (a - b) b

-- You can either use Mathlib.Data.Num.Basic.Num.gcd
-- or try to mimic same appoach to proove that function teminates.
-- First parameter to gcdAux is fuel for the algorithm and represent the upper
-- bound for execution. We already know that Fink's runtime bound on
-- the number of steps in Euclid's algorithm place the limit to
-- Nat.log2 b, in our case we set even greater bound.
def gcdAux : Nat → UInt16 → UInt16 → UInt16
  | 0, _, b => b
  | Nat.succ _, 0, b => b
  | Nat.succ n, a, b => gcdAux n (b % a) a

/-- Greatest Common Divisor (GCD) of two `UInt16`s. -/
def gcd (a b : UInt16) : UInt16 :=
  if a ≤ b then gcdAux (a.toNat + b.toNat) a b else gcdAux (b.toNat + a.toNat) b a

-- If you want to avoid fuel, you can make recursion
-- well-founded. It means that we prove that value
-- would be decreasing, and eventually stop.
-- Since we have Nat datatype, we know if subsequent calls
-- decrease m (<), then we eventually reach 0.
def gcdWellFounded (m n : Nat) : Nat :=
  if m = 0 then
    n
  else
    gcdWellFounded (n % m) m
  -- Additional proof of well-foundness below
  termination_by m
  decreasing_by
    simp_wf;
    apply Nat.mod_lt _ (Nat.zero_lt_of_ne_zero _);
    assumption

-- This example computes the sum of a list of integers using recursion.
--
-- '::' is used to split a list into the head and tail of the list,
-- the head being the first element and the tail being the rest of the list.
def sumList xs :=
    match xs with
    | []    => 0
    | y::ys => y + sumList ys

-- This makes 'sumList' tail recursive, using a helper function with a result accumulator.
def sumListTailRecHelper (accumulator: Nat) xs :=
    match xs with
    | []    => accumulator
    | y::ys => sumListTailRecHelper (accumulator+y) ys

-- This invokes the recursive helper function, providing '0' as a seed accumulator.
def sumListTailRecursive xs := sumListTailRecHelper 0 xs

def oneThroughTen := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

end RecursiveFunctions
