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

@testset "Day 4" begin
    sample = """
    7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

    22 13 17 11  0
     8  2 23  4 24
    21  9 14 16  7
     6 10  3 18  5
     1 12 20 15 19

     3 15  0  2 22
     9 18 13 17  5
    19  8  7 25 23
    20 11 10 24  4
    14 21 16 12  6

    14 21 17 24  4
    10 16 15  9 19
    18  8 23 26 20
    22 11 13  6  5
     2  0 12  3  7
    """
    @test AdventOfCode2021.Day04.part1(sample) == 4512
end
