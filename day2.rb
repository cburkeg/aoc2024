input_file = File.new "day2_input.text"
puzzle_input = input_file.read

safe_counter = 0

puzzle_input.each_line do |line|
  
  if line.split.map(&:to_i) == line.split.map(&:to_i).sort || line.split.map(&:to_i) == line.split.map(&:to_i).sort.reverse
    safe_report = true
    (line.split.length - 1).times do |i|
      safe_report = false if [1,2,3].include?((line.split[i].to_i - line.split[i+1].to_i).abs) == false 
    end
    safe_counter += 1 if safe_report == true
  end
end

puts "There are #{safe_counter} safe reports in total."

