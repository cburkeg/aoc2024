# Day 3 Part 2

def get_total_of_do_block(do_block)
  block_total = 0
  do_block.scan(/[m][u][l][(]\d{1,3}[,]\d{1,3}[)]/).each do |mul_instruction|
    block_total += mul_instruction.scan(/\d{1,3}/).first.to_i * mul_instruction.scan(/\d{1,3}/).last.to_i 
  end
  block_total
end

input_file = File.new "day3_input.text"
puzzle_input = input_file.read
puzzle_input.gsub!("\n", "-")

total = 0

puzzle_input.scan(/(:?do\(\)|\A)(.*?)(:?don't\(\)|\z)/).each do |do_block|
    total += get_total_of_do_block(do_block[1])
  end

puts "The total output is #{total}"
