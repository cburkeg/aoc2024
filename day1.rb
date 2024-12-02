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

puts "The total distance is: #{summed_distance}"

# Part 2 

similarity_score = 0 

left_list.each do |n|
  similarity_score += n * right_list.find_all{|k| k == n}.length
end

puts "The total similarity score is: #{similarity_score}"