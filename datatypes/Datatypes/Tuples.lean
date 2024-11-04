namespace Tuples

    -- A simple tuple of integers.
    def tuple1 := (1, 2, 3)

    -- A function that swaps the order of two values in a tuple.
    --
    -- F# Type Inference will automatically generalize the function to have a generic type,
    -- meaning that it will work with any type.
    def swapElems (a: α × β) : β × α := (a.snd, a.fst)

    --printfn $"The result of swapping (1, 2) is {(swapElems (1,2))}"

    -- A tuple consisting of an integer, a string,
    -- and a double-precision floating point number.
    def tuple2 := (1, "fred", 3.1415)

    --printfn $"tuple1: {tuple1}\ttuple2: {tuple2}"
end Tuples
