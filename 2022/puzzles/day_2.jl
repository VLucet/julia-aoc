using Test

test_input =
"A Y
B X
C Z"

input = read("2022/inputs/day_2.txt", String)

# Part 1

parsed = [split(x, " ") for x in split(test_input, "\n")]

char_map = Dict("A" => "Rock", "B" => "Paper", "C" => "Scissors", 
                "X" => "Rock",  "Y" => "Paper", "Z" => "Scissors")
game_map = Dict("Rock" => Dict("Rock" => 1 + 3, "Paper" => 2 + 6, "Scissors" => 3), 
                "Paper" => Dict("Rock" => 1, "Paper" => 2 + 3, "Scissors" => 3 + 6),
                "Scissors" => Dict("Rock" => 1 + 6, "Paper" => 2, "Scissors" => 3 + 3))

function play_game(game)
    return(game_map[char_map[game[1]]][char_map[game[2]]])
end

@test sum(play_game.(parsed)) == 15

parsed = [split(x, " ") for x in split(input, "\n")]

sum(play_game.(parsed))

# Part 2

char_map = Dict("A" => "Rock", "B" => "Paper", "C" => "Scissors", 
                "X" => "Loose",  "Y" => "Draw", "Z" => "Win")
game_map = Dict("Rock" => Dict("Draw" => 1 + 3, "Win" => 2 + 6, "Loose" => 3), 
                "Paper" => Dict("Loose" => 1, "Draw" => 2 + 3, "Win" => 3 + 6),
                "Scissors" => Dict("Win" => 1 + 6, "Loose" => 2, "Draw" => 3 + 3))

function play_game_again(game)
    return(game_map[char_map[game[1]]][char_map[game[2]]])
end

@test sum(play_game_again.(parsed)) == 12

parsed = [split(x, " ") for x in split(input, "\n")]

sum(play_game_again.(parsed))