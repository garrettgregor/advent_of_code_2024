# frozen_string_literal: true

require "./lib/print_queue"

PATH = "./fixtures/puzzle_input_1.txt"
instance = PrintQueue.new(PATH)

puts "Part 1 - Sum of middle of correctly-ordered updates: #{instance.sum_correct_middles}"
