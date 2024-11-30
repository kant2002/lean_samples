namespace IntegersAndNumbers

    -- This is a sample integer.
    def sampleInteger := 176

    -- This is a sample floating point number.
    def sampleDouble := 4.1

    -- This computed a new number by some arithmetic.
    -- Numeric types are converted using
    -- functions toXXXX
    -- Sometimes conversion from type to type is not provided,
    -- and you have to chain conversion
    -- from one to another.
    def sampleInteger2 :=
        (sampleInteger/4 + 5 - 7) * 4
        + sampleDouble.toUInt64.toNat

end IntegersAndNumbers
