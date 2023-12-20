test_input = 
"2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8";

input = read("2022/inputs/day_4.txt", String);

# Part 1

parsed = map(x -> [parse.(Int, y) for y in x],
            map(x -> split.(x, "-"), 
                split.(split(input, "\n"), ",")))

overlaps = map(x  -> issubset(Set(x[1]), Set(x[2])) | 
                        issubset(Set(x[2]), Set(x[1])), 
            map(x -> [y[1]:y[2] for y in x], parsed))

sum(overlaps)

# Part 2

overlaps = map(x  -> intersect(collect(x[1]), collect(x[2])), 
            map(x -> [y[1]:y[2] for y in x], parsed))

sum(isempty.(overlaps) .== 0)