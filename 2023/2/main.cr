def get_game_id(line) : Int32
  line.match!(/Game (\d+)/).captures[0].not_nil!.to_i
end

def get_cubes(line) : Hash(String, Int32)
  cubes_count = Hash(String, Int32).new
  line.scan(/([^;]+)/) do |match|
    set = match.captures[0]
    if set
      cubes_from_set = Hash(String, Int32).new
      set.scan(/([^,]+)/) do |match|
        set_info = match.captures[0]
        if set_info
          parts = set_info.split
          type = parts[1]
          count = parts[0]
          cubes_from_set[type] = count.to_i
        end
      end
      update_cubes_count(cubes_count, cubes_from_set)
    end
  end

  cubes_count
end

def update_cubes_count(cubes_count, cubes_from_set)
  cubes_from_set.each do |type, count|
    current_count = cubes_count[type]? || 0
    cubes_count[type] = Math.max(count, current_count)
  end
end

def is_game_posible?(cubes_count, cubes_from_game)
  cubes_count.all? do |type, count|
    cubes_availables = cubes_from_game[type]? || 0
    cubes_availables >= count
  end
end

def get_power(cubes_count : Hash(String, Int32))
  power = 1
  cubes_count.each_value do |count|
    power *= count
  end
  power
end

CUBES = {
  "red"   => 12,
  "green" => 13,
  "blue"  => 14,
}

File.open("#{__DIR__}/input.txt") do |file|
  games = Array(Int32).new
  powers = Array(Int32).new

  file.each_line do |line|
    parts = line.partition ":"
    id = get_game_id parts[0]
    cubes = get_cubes parts[2]
    games << id if is_game_posible? cubes, CUBES
    powers << get_power cubes
  end

  puts games.sum
  puts powers.sum
end
