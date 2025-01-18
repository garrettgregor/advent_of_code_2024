# frozen_string_literal: true

require "./lib/cares"

PATH = "./fixtures/puzzle_input_1.txt"
instance = Cares.new(PATH)
puts "Hor: #{instance.horizontal}"
puts "Ver: #{instance.vertical}"
puts "Diag: #{instance.diagonal}"
puts "Part 1: #{instance.solve_part_1}"
# puts "Part 1**: #{instance.part_one()}"
# puts "Part 2: #{instance.problem_dampener_safe_reports}"
