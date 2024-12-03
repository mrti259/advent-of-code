def safe?(parts : Array(Int), tolerate : Bool) : Bool
    is_unsafe = false
    is_incr = nil
    1.upto(parts.size - 1) do |i|
        next if is_unsafe
        diff = parts[i] - parts[i-1]
        is_unsafe = (diff == 0) || (diff.abs > 3)
        unless is_unsafe
            is_incr = diff > 0 if is_incr.nil?
            is_unsafe = is_incr != (diff > 0)
        end
        if is_unsafe && tolerate
            tolerate = false
            copy = parts.dup
            copy.delete_at i
            is_unsafe = !safe?(copy, tolerate)
            puts "#{parts} #{copy}"
        end
    end
    !is_unsafe
end

File.open __DIR__ + "/input.txt", do |file|
    safe_count = 0
    file.each_line do |line|
        parts = line.split(" ").map(&.to_i)
        safe_count += 1 if safe?(parts, true)
    end
    puts "Safe count: #{safe_count}"
end