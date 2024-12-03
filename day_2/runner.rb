# frozen_string_literal: true

require "./lib/red_nosed_report.rb"

PATH = "./fixtures/puzzle_input_1.txt".freeze
report = RedNosedReport.new(PATH)

puts "Part 1 - Number of Safe Reports: #{report.number_of_safe_reports}"
puts "Part 2 - Number of Problem Dampener Safe Reports: #{report.number_of_problem_dampener_safe_reports}"
