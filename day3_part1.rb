# Day 3 Part 1

input_file = File.new "day3_input.text"
puzzle_input = input_file.read

total = 0

puzzle_input.scan(/[m][u][l][(]\d{1,3}[,]\d{1,3}[)]/).each do |mul_instruction|
  total += mul_instruction.scan(/\d{1,3}/).first.to_i * mul_instruction.scan(/\d{1,3}/).last.to_i 
end

puts "The total output is #{total}"
