module Day06

using AdventOfCode2021
using LinearAlgebra
using StatsBase

mutable struct LanternFish
    timer::Int64
end

LanternFish() = LanternFish(8)
getpop(fish::Vector{LanternFish}) = length(fish)
printfish(fish::Vector{LanternFish}) = foreach(f->print(f.timer,","), fish)
spawn(n::Int64, pop::Vector{LanternFish}) = for _ ∈ 1:n
    push!(pop, LanternFish())
end

function day06(input::String = readline(joinpath(@__DIR__, "..", "data", "day06.txt")))
    init = input |> l->split(l,",") .|> i->parse(Int, i)
    fish = init .|> LanternFish
    return [part1(fish), part2(init)]
end

function part1(fish::Vector{LanternFish})
    days = 80
    for _ ∈ 1:days
        new = 0
        for f ∈ fish
            if f.timer == 0
                new += 1
                f.timer = 6
            else
                f.timer -= 1
            end
        end
        spawn(new, fish)
    end
    #= fish |> printfish =#
    return fish |> getpop
end

function part2(ages::Vector{Int64})
    x = StatsBase.counts(ages, 0:8)
    A = Int[ 0 0 0 0 0 0 1 0 1
             I(8) zeros(8)]
    x'A^256 |> sum
end

end
