# frozen_string_literal: true

require "./lib/mull"

PATH = "./fixtures/puzzle_input.txt"
instance = Mull.new(PATH)

puts "Part 1 - Sum of Multiplications: #{instance.sum_of_all_lines}"
