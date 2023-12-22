test_input = 
"mjqjpqmgbljsphdztnvjfqwrcgsmlb"

input = read("2022/inputs/day_6.txt", String)

# Part 1

function find_starter_char(str_vec; win=3)
    i = findfirst(
        map(x -> length(Set(split(x, ""))) == win+1, 
            [str_vec[x:x+win] for x = 1:length(str_vec)-win])
    )
    i === nothing ? 0 : i + win
end

find_starter_char(input)

# Part 2

find_starter_char(input; win=14)