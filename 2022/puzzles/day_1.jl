using Test

test_input = 
"1000
2000
3000

4000

5000
6000

7000
8000
9000

10000"

input = read("2022/inputs/day_1.txt", String)

# Part 1

function sum_calories(cals)
    splitted = split(cals, "\n\n")
    parsed = [parse.(Int64, split(x, "\n")) for x in splitted]
    sums = sum.(parsed)
    return sums
end

@test maximum(sum_calories(test_input)) == 24000

maximum(sum_calories(input))

# Part 2

sum(sort(sum_calories(input) ; rev =true)[1:3])

