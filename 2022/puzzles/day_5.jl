test_input = 
"    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2";

input = read("2022/inputs/day_5.txt", String);

# Part 1

function get_initial_state(input)
    raw = split(input, "\n\n")[1]
    raw_arr = collect.(split(raw, "\n"))
    raw_arr_sub = map(x -> x[2:4:end], raw_arr)[1:(end-1)]
    mat = mapreduce(permutedims, vcat, raw_arr_sub)
    mat_perm = mat[end:-1:1,:] |> permutedims
    vecs = [mat_perm[i,:] for i in 
            eachindex(eachrow(mat_perm))]
    map(a -> filter(b -> b != ' ', a), vecs)
end

function parse_instructions(input)
    raw = split(input, "\n\n")[2]
    raw_arr = split(raw, "\n")
    map(x -> parse.(Int, split(x, " ")[[2, 4, 6]]), raw_arr)
end

state = get_initial_state(input)
insts = parse_instructions(input)

function run_insts(state, insts)
    if length(insts) == 0
        println("reached end state")
        return(state)
    else 
        the_int = insts[1]
        for _ in 1:the_int[1]
            push!(state[the_int[3]], 
                  pop!(state[the_int[2]]))
            # println(state)
        end
        run_insts(state, insts[2:end])
    end
end

run_insts(state, insts)
map(x -> last(x), state) |> join

# Part 2

state = get_initial_state(input)

function run_insts_2(state, insts)
    if length(insts) == 0
        println("reached end state")
        return(state)
    else 
        the_int = insts[1]
        for i in the_int[1]:-1:1
            push!(state[the_int[3]], 
                  popat!(state[the_int[2]],
                         length(state[the_int[2]]) - (i-1)))
            # println(state)
        end
        run_insts_2(state, insts[2:end])
    end
end

run_insts_2(state, insts)
map(x -> last(x), state) |> join