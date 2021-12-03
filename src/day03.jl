module Day03

using AdventOfCode2021

function day03(input::String = readInput(joinpath(@__DIR__, "..", "data", "day03.txt")))
    values = String.(split(input, "\n"))
    pop!(values)
    return [part1(values), part2(values)]
end

function part1(values::Array{String,1})
    bitsum = zeros(Int, 1, length(first(values)))
    for v in values
        for i in 1:length(v)
            bitsum[i] += parse(Int, v[i])
        end
    end
    γ = bitsum .|> >(length(values)/2) .|> Int |> join
    ϵ = bitsum .|> <(length(values)/2) .|> Int |> join
    parse(Int, "0b"*γ) * parse(Int, "0b"*ϵ)
end

function part2(values::Array{String,1})
    O₂values = deepcopy(values)
    CO₂values = deepcopy(values)
    O₂, CO₂ = "", ""
    #= @info "Finding Oxygen Generator Rating" =#
    for i in 1:length(first(O₂values))
        #= @info "O₂ index: $i" =#
        bitsum = 0
        for v in O₂values
            bitsum += parse(Int, v[i])
        end
        bit = bitsum |> >=(length(O₂values) / 2) |> Int
        #= @info "O₂ bit: $bit" =#
        filter!(v->parse(Int, v[i])==bit, O₂values)
        #= @info "O₂ values: $O₂values" =#
        length(unique(O₂values)) == 1 && (O₂ = first(unique(O₂values)))
    end
    #= @info "Finding CO₂ Scrubber Rating" =#
    for i in 1:length(first(CO₂values))
        #= @info "CO₂ index: $i" =#
        bitsum = 0
        for v in CO₂values
            bitsum += parse(Int, v[i])
        end
        bit = bitsum |> <(length(CO₂values) / 2) |> Int
        #= @info "CO₂ bit: $bit" =#
        filter!(v->parse(Int, v[i])==bit, CO₂values)
        #= @info "CO₂ values: $CO₂values" =#
        length(unique(CO₂values)) == 1 && (CO₂ = first(unique(CO₂values)))
    end
    #= @info "Finding Life Support Rating" =#
    parse(Int, "0b"*O₂) * parse(Int, "0b"*CO₂)
end

end # module
