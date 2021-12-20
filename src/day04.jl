module Day04

using AdventOfCode2021

mutable struct Board
    rows::Vector{Set{Int64}}
    cols::Vector{Set{Int64}}
    remaining::Set{Int64}
    lastnum::Union{Int64,Missing}
    complete::Bool
    score::Union{Int64,Missing}
end

function Board(rows::Vector{Vector{Int64}})
    Board(
        [Set(collect(Iterators.flatten(row))) for row in rows],
        [Set(reduce(hcat, rows)[i,:]) for i=1:5],
        Set(collect(Iterators.flatten(rows))),
        missing,
        false,
        missing,
    )
end

function turn(draw::Int64, board::Board)
    if !board.complete && draw ∈ board.remaining
        delete!.(board.rows, draw)
        delete!.(board.cols, draw)
        delete!(board.remaining, draw)
        board.lastnum = draw
        board.complete = any([isempty(row) for row in board.rows]) || any([isempty(col) for col in board.cols])
        if board.complete
            board.score = board.lastnum * sum(board.remaining)
        end
    end
end

function day04(input::String = joinpath(@__DIR__, "..", "data", "day04.txt"))
    draws = parse.(Int, split(readline(input), ","))
    rows = [parse.(Int, split(l)) for l in readlines(input)[2:end] if !isempty(l)]
    boards = [Board(rows[i:i+4]) for i=1:5:length(rows)]
    for draw in draws, board in boards
        turn(draw, board)
    end
    return [part1(draws, boards), part2(draws, boards)]
end

function part1(draws::Vector{Int64}, boards::Vector{Board})
    finish = [indexin(skipmissing(board.lastnum), draws) for board in boards] |> Iterators.flatten |> collect
    firstwinner = first(filter(b->b.lastnum == draws[first(extrema(finish))], boards))
    return firstwinner.score
end

function part2(draws::Vector{Int64}, boards::Vector{Board})
    finish = [indexin(skipmissing(board.lastnum), draws) for board in boards] |> Iterators.flatten |> collect
    lastwinner = first(filter(b->b.lastnum == draws[last(extrema(finish))], boards))
    return lastwinner.score
end

function initday04(input::String = readlines(joinpath(@__DIR__, "..", "data", "day04.txt")))
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

function initpart1(draws::Vector{Int}, boards::Vector{Matrix{Int}})
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

end # module
