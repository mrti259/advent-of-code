def add_to_nums(nums, current_line, previous_line)
    symbol_found = false
    current_num = ""

    0.upto(current_line.size - 1) do |index|
        current_char = current_line[index]
        neightbours = get_neightbours(current_line, previous_line, index)

        if current_char.number?
            if neightbours.any? {|char| symbol?(char)}
                symbol_found = true
            end
            current_num += current_char
        else
            if symbol_found
                if num = current_num.to_i?
                    nums << num if symbol_found
                end
                symbol_found = false
            end

            unless current_num.blank?
                current_num = ""
            end
        end
    end

    if !current_num.empty? && symbol_found
        nums << current_num.to_i
    end
end

def get_neightbours(current_line, previous_line, index)
    neightbours = Array(Char).new
    
    left_limit = Math.max(0, index-1)
    right_limit = Math.min(current_line.size-1, index+1)
    left_limit.upto(right_limit) do |i|
        neightbours << previous_line[i] if previous_line[i]?
        neightbours << current_line[i] if i != index
    end

    neightbours
end

def symbol?(char : Char) : Bool
    char != '.' && !char.number?
end

File.open("inputs/3.txt") do |file|
    nums = Array(Int32).new

    previous_line = ""
    file.each_line do |current_line|
        #1
        add_to_nums(nums, previous_line.gsub(/\D/, '.'), current_line)
        add_to_nums(nums, current_line, previous_line)

        #2
        

        previous_line = current_line
    end

    puts "1. #{nums.sum}"
end