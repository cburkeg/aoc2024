# Day 2 Part 2

def check_report(report)
  if report.split.map(&:to_i) == report.split.map(&:to_i).sort || report.split.map(&:to_i) == report.split.map(&:to_i).sort.reverse
    safe_report = true
    (report.split.length - 1).times do |i|
      safe_report = false if [1,2,3].include?((report.split[i].to_i - report.split[i+1].to_i).abs) == false 
    end
    safe_report
  end
end

input_file = File.new "day2_input.text"
puzzle_input = input_file.read

safe_counter = 0

puzzle_input.each_line do |line|

  if check_report(line)
    safe_counter += 1
  else 
    safe_after_dampening = false
    (line.split.length).times do |i|
      safe_after_dampening = true if check_report(line.split[0, i].join(" ") + " " + line.split[ i + 1, line.split.length - (1 + i)].join(" "))
    end
    safe_counter += 1 if safe_after_dampening
  end 
end

puts "There are #{safe_counter} safe reports in total."