module Day07

using AdventOfCode2021

function day07(input = readline(joinpath(@__DIR__, "..", "data", "day07.txt")))
    pos = input |> i->split(i,",") .|> i->parse(Int, i)
    return [part1(pos), part2(pos)]
end

function part1(pos::Vector{Int64})
    n, m = extrema(pos)
    return minimum(pos .- i .|> abs |> sum for i ∈ n:m)
end

function part2(pos::Vector{Int64})
    n, m = extrema(pos)
    travel(i) = pos .- i .|> abs
    expense(x) = x .* (x .+ 1) .÷ 2
    return minimum(i |> travel |> expense |> sum for i ∈ n:m)
end

end
