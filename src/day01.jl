module Day01

using AdventOfCode2021

function day01(input::String = readInput(joinpath(@__DIR__, "..", "data", "day01.txt")))
    values = parse.(Int, split(input))
    return [part1(values), part2(values)]
end

const NOT_AVAILABLE = "(N/A - no previous measurement)"
const INCREASED = "(increased)"
const DECREASED = "(decreased)"

function part1(values::Array{Int,1})
    change = String[]
    push!(change, NOT_AVAILABLE)
    for (i, v) in enumerate(Iterators.rest(values, 2))
        v > values[i] && push!(change, INCREASED)
        v < values[i] && push!(change, DECREASED)
    end
    return count(==(INCREASED), change)
end

function part2(values::Array{Int,1})
    windows = []
    for i in 1:length(values)-2
        push!(windows, sum(values[i:i+2]))
    end
    change = String[]
    push!(change, NOT_AVAILABLE)
    for (i, w) in enumerate(Iterators.rest(windows, 2))
        w > windows[i] && push!(change, INCREASED)
        w < windows[i] && push!(change, DECREASED)
    end
    return count(==(INCREASED), change)
end

function alternative()
    input = parse.(Int, readlines("../data/day01.txt"))

    # *
    ∑Δ(i) = i |> diff |> .|> >(0) |> sum |> println

    # **
    windows = [ sum(input[i:i+2]) for i=1:length(input)-2 ]

    return [∑Δ(input), ∑Δ(windows)]
end

end # module
