File.open "./2024/1/input.txt", do |file|
    list0 = Array(Int32).new
    list1 = Array(Int32).new
    file.each_line do |line|
        parts = line.split "   "
        list0 << parts[0].to_i
        list1 << parts[1].to_i
    end

    hash_list1 = list1.tally
    similarities = list0.map do |num0|
        num0 * (hash_list1[num0]? || 0)
    end

    list0.sort!
    list1.sort!
    distances = list0.map_with_index do |num0, i|
        diff = num0 - list1[i]
        diff.abs
    end

    puts "Distance score: #{distances.sum}"
    puts "Similarity score: #{similarities.sum}"
end