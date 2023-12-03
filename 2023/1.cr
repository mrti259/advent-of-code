def calibration_sum_from(document)
    sum = 0

    document.each_line do |line|
        nums = get_numbers_from line
        num = (10 * nums.first + nums.last)
        sum += num
    end

    sum
end

def get_numbers_from(line : String) : Array(Int32)
    STR_TO_NUM.each do |k,v|
        line = line.gsub(k, "#{k}#{v}#{k}")
    end

    line.chars.select{|char|char.number?}.map{|char|char.to_i}
end

STR_TO_NUM = {
    "zero" => 0,
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
}

###

test_1 = <<-DOC
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
DOC

test_2 = <<-DOC
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
DOC

puts calibration_sum_from test_1

puts calibration_sum_from test_2

File.open("inputs/1.txt") do |file|
    puts calibration_sum_from file
end