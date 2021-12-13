module Day04

using AdventOfCode2021

function day04(input::String = readlines(joinpath(@__DIR__, "..", "data", "day04.txt")))
    draws = parse.(Int, split(input[1], ","))
    boards = Matrix{Int}[]
    for i=3:6:length(input[2:end])-3
        newboard = [
            parse.(Int, split(input[i]))
            parse.(Int, split(input[i + 1]))
            parse.(Int, split(input[i + 2]))
            parse.(Int, split(input[i + 3]))
            parse.(Int, split(input[i + 4]))
        ]
        push!(boards, permutedims(reshape(newboard, (5,5))))
    end
    return [part1(draws, boards), part2(draws, boards)]
end

function part1(draws::Vector{Int}, boards::Vector{Matrix{Int}})
    index_drawn = [ indexin(s, draws) for s in boards ]
    row_maximums = Int[]
    col_maximums = Int[]
    for d in index_drawn
        for i in 1:first(size(d))
            push!(row_maximums, maximum(d[i, :]))
        end
        for i in 1:last(size(d))
            push!(col_maximums, maximum(d[:, i]))
        end
    end
    if minimum(row_maximums) < minimum(col_maximums)
        winning_draw, winning_row = findmin(row_maximums)
        winning_number = draws[winning_draw]
        winning_board_number = Int(ceil(winning_row / first(size(first(boards)))))
        undrawn = setdiff(boards[winning_board_number], draws[1:winning_draw])
        return sum(undrawn) * winning_number
    else
        winning_draw, winning_column = findmin(col_maximums)
        winning_number = draws[winning_draw]
        winning_board_number = Int(ceil(winning_column / last(size(first(boards)))))
        undrawn = setdiff(boards[winning_board_number], draws[1:winning_draw])
        return sum(undrawn) * winning_number
    end
end

function part2(draws::Vector{Int}, boards::Vector{Matrix{Int}})
end

end # module
