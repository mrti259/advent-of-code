File.open("inputs/4.txt") do |file|
    scores = Array(Int32).new

    file.each_line do |current_line|
        current_line.scan(/^([^:]+): ([^\|]+) \| (.+)$/) do |match|
            winning_nums = match[2].split.map(&.to_i)
            card_nums = match[3].split.map(&.to_i)

            score = 0
            winning_nums.each do |winning_num|
                if card_nums.includes? winning_num
                    score += Math.max(score, 1)
                end
            end
            scores << score if score > 0
        end
    end

    puts scores.sum
end