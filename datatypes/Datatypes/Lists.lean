namespace Lists
    -- Lists are defined using [ ... ].  You should specify type for empty list.
    def list1 : List Nat := [ ]

    -- This is a list with 3 elements.  ';' is used to separate elements on the same line.
    def list2 := [ 1; 2; 3 ]

    -- You can also separate elements by placing them on their own lines.
    def list3 := [
        1,
        2,
        3
    ]

    -- This is a list of integers from 1 to 1000
    def numberList := List.range' 1 1000

    -- Lists can be transformed using 'List.map' and other functional programming combinators.
    -- This definition produces a new list by squaring the numbers in numberList, using the pipeline
    -- operator to pass an argument to List.map.
    def squares :=
        numberList
        |> List.map (fun x => x*x)

    def sumBy (vf: Nat → Nat) (list: List Nat) :=
      List.foldl (fun state item => state + item) 0 (List.map vf list)

    -- There are many other list combinations. The following computes the sum of the squares of the
    -- numbers divisible by 3.
    def sumOfSquares :=
        numberList
        |> List.filter (fun x => x % 3 = 0)
        |> sumBy (fun x => x * x)

    --printfn $"The sum of the squares of numbers up to 1000 that are divisible by 3 is: %d{sumOfSquares}"

end Lists
