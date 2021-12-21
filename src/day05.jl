module Day05

using AdventOfCode2021

struct Line
    x₁::Int64
    y₁::Int64
    x₂::Int64
    y₂::Int64
end

function Line(coord::Vector{SubString{String}})
    xs, ys = coord
    x₁ = parse(Int, first(split(xs, ",")))
    x₂ = parse(Int, last(split(xs, ",")))
    y₁ = parse(Int, first(split(ys, ",")))
    y₂ = parse(Int, last(split(ys, ",")))
    Line(x₁+1, x₂+1, y₁+1, y₂+1)
end

function maxcoord(lines::Vector{Line})
    maxcoord = 0
    for line in lines
        linemax = maximum([line.x₁, line.y₁, line.x₂, line.y₂])
        maxcoord = max(linemax, maxcoord)
    end
    maxcoord
end

function markline(field::Matrix{Int64}, line::Line)
    if line.x₁ == line.x₂
        littley = line.y₁ < line.y₂ ? line.y₁ : line.y₂
        bigy = line.y₁ > line.y₂ ? line.y₁ : line.y₂
        for y in littley:bigy
            field[y, line.x₁] += 1
        end
    end
    if line.y₁ == line.y₂
        littlex = line.x₁ < line.x₂ ? line.x₁ : line.x₂
        bigx = line.x₁ > line.x₂ ? line.x₁ : line.x₂
        for x in littlex:bigx
            field[line.y₁, x] += 1
        end
    end
end

function day05(input::Vector{String} = readlines(joinpath(@__DIR__, "..", "data", "day05.txt")))
    coords = split.(input, " -> ")
    lines = [Line(coord) for coord in coords]
    return part1(lines)
end

function part1(lines::Vector{Line})
    oceanfloor = zeros(Int, maxcoord(lines), maxcoord(lines))
    for line in lines
        markline(oceanfloor, line)
    end
    count(>=(2), oceanfloor)
end

function part2()
end

end
