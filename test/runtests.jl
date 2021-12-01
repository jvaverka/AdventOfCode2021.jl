using AdventOfCode2021
using Test

@testset "Day 1" begin
    sample = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    @test AdventOfCode2021.Day01.part1(sample) == 7
    @test AdventOfCode2021.Day01.part2(sample) == 5
    @test AdventOfCode2021.Day01.day01() == [1709, 1761]
end
