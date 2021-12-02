module Day02

using AdventOfCode2021

function day02(input::String = readInput(joinpath(@__DIR__, "..", "data", "day02.txt")))
    values = String.(split(input, "\n"))
    pop!(values)
    return [part1(values), part2(values)]
end

function part1(values::Array{String,1})
    # ( horizontal, depth )
    coord = CartesianIndex(0, 0)
    for v in values
        magnitude = parse(Int, split(v)[2])
        startswith(v, "f") && (coord += CartesianIndex(magnitude, 0))
        startswith(v, "d") && (coord += CartesianIndex(0, magnitude))
        startswith(v, "u") && (coord += CartesianIndex(0,-magnitude))
    end
    first(coord.I) * last(coord.I)
end

function part2(values::Array{String,1})
    # ( horizontal, depth, aim )
    coord = CartesianIndex(0, 0, 0)
    for v in values
        magnitude = parse(Int, split(v)[2])
        if startswith(v, "f")
            coord += CartesianIndex(magnitude, 0, 0)
            coord += magnitude * CartesianIndex(0, coord.I[3], 0)
        end
        startswith(v, "d") && (coord += CartesianIndex(0, 0, magnitude))
        startswith(v, "u") && (coord += CartesianIndex(0, 0,-magnitude))
    end
    coord.I[1] * coord.I[2]
end

end # module
