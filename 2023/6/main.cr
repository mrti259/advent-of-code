input = Path[__DIR__].join("input.txt")
lines = File.read_lines(input).map do |line|
  line.partition(':')[2].split.map(&.to_i)
end

beatings = Array(Int32).new

0.upto(lines.size + 1) do |index|
  time = lines[0][index]
  distance = lines[1][index]

  record_beatings = 0

  0.to(time) do |time_to_hold|
    speed = time_to_hold
    time_to_run = time - time_to_hold
    record_beatings += 1 if speed * time_to_run > distance
  end

  beatings << record_beatings if record_beatings > 0
end

puts beatings.product
