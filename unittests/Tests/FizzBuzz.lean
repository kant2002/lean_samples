import LSpec
import Unittests

open LSpec

def testFizzBuzz : TestSeq :=
  group "Small numbers" $
    test "fizzbuzz(1) = 1"
      (fizzbuzz 1 = "1") $
    test "fizzbuzz(2) = 2"
      (fizzbuzz 2 = "2") $
    test "fizzbuzz(3) = Fizz"
      (fizzbuzz 3 = "Fizz") $
    test "fizzbuzz(5) = Buzz"
      (fizzbuzz 5 = "Buzz")

def testFizzBuzzLargeNumbers : TestSeq :=
  group "Large numbers" $
    test "150"
      (fizzbuzz 150 = "FizzBuzz") $
    test "100"
      (fizzbuzz 100 = "Buzz") $
    test "33"
      (fizzbuzz 33 = "Fizz")

def main : IO UInt32 :=
  lspecIO $
    testFizzBuzz ++
    testFizzBuzzLargeNumbers
