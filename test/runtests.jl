using AdventOfCode2021
using Test

@testset "Day 1" begin
    sample = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    @test AdventOfCode2021.Day01.part1(sample) == 7
    @test AdventOfCode2021.Day01.part2(sample) == 5
    @test AdventOfCode2021.Day01.day01() == [1709, 1761]
end

@testset "Day 2" begin
    sample = ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]
    @test AdventOfCode2021.Day02.part1(sample) == 150
    @test AdventOfCode2021.Day02.part2(sample) == 900
    @test AdventOfCode2021.Day02.day02() == [1728414, 1765720035]
end

@testset "Day 3" begin
    sample = [
        "00100",
        "11110",
        "10110",
        "10111",
        "10101",
        "01111",
        "00111",
        "11100",
        "10000",
        "11001",
        "00010",
        "01010",
    ]
    @test AdventOfCode2021.Day03.part1(sample) == 198
    @test AdventOfCode2021.Day03.part2(sample) == 230
    @test AdventOfCode2021.Day03.day03() == [3633500, 4550283]
end
