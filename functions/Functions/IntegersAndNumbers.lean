namespace IntegersAndNumbers

    -- This is a sample integer.
    def sampleInteger := 176

    -- This is a sample floating point number.
    def sampleDouble := 4.1

    -- This computed a new number by some arithmetic.  Numeric types are converted using
    -- functions toXXXX
    -- Sometimes conversion from type to type is not provided, and you have to chain conversion
    -- from one to another.
    def sampleInteger2 := (sampleInteger/4 + 5 - 7) * 4 + sampleDouble.toUInt64.toNat

    -- This is a list of the numbers from 0 to 99.
    def sampleNumbers := List.range 99

    -- This is a list of all tuples containing all the numbers from 0 to 99 and their squares.
    def sampleTableOfSquares := List.map (fun x => (x, x*x)) (List.range 99)

    -- You can use λ instead of fun keyword when defining functions
    def otherSampleTableOfSquares := List.map (λ x => (x, x*x)) (List.range 99)

end IntegersAndNumbers
