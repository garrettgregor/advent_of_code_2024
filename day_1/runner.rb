require "./lib/historian_hysteria.rb"

file_path = "./fixtures/puzzle_input_1.txt"
historian = HistorianHysteria.new(file_path)
puts "Part 1: #{historian.sum_of_differences}"
