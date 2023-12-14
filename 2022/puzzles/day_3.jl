
test_input = 
"vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw";

input = read("2022/inputs/day_3.txt", String);

# Part 1

parsed = split(input, "\n");
char_dict = merge!(Dict('a':'z'.=> 1:26), Dict('A':'Z'.=> 27:52))

intersections =
[begin 
    p1 = p[1:Int(length(p)/2)] 
    p2 = p[(Int(length(p)/2)+1):end] 
    intersect(p1, p2)
end
    for p in parsed]

sum([char_dict[c[1]] for c in intersections])    

# Part 2

parsed = split(input, "\n");
char_dict = merge!(Dict('a':'z'.=> 1:26), Dict('A':'Z'.=> 27:52))
parsed_by_3 = [parsed[s:s+2] for s in 1:3:length(parsed)]

intersections =
[begin 
    intersect(p...)
end
    for p in parsed_by_3]

sum([char_dict[c[1]] for c in intersections]) 
