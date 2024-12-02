require 'matrix'

input_file = File.new "day1_input.text"
puzzle_input = input_file.read

left_list = []
right_list = []

puzzle_input.each_line do |line|
  left_list.append(line.split[0].to_i)
  right_list.append(line.split[1].to_i)
end

distance_vector = Vector.elements(left_list.sort) - Vector.elements(right_list.sort)
summed_distance = distance_vector.to_a.reduce{|sum, n| (sum).abs + (n).abs}

puts "The answer is: #{summed_distance.to_s}"