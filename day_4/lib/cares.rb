# frozen_string_literal: true

class Cares
  attr_reader :lines, :checked_coords, :xmas_strings_found, :parse

  def initialize(file_path)
    @lines = File.readlines(file_path, chomp: true).map do |line|
      line
    end
    @checked_coords = []
    @xmas_strings_found = 0
  end

  def horizontal
    count = 0

    lines.each do |line|
      l_to_r_count = line.scan(/XMAS/).count
      r_to_l_count = line.scan(/SAMX/).count

      count += r_to_l_count
      count += l_to_r_count
    end

    count
  end

  def vertical # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
    count = 0

    lines.each_with_index do |line, y_index|
      line.chars.each_with_index do |char, x_index|
        if char == "X" &&
           (lines&.[](y_index + 1)&.[](x_index) == "M" &&
           lines&.[](y_index + 2)&.[](x_index) == "A" &&
           lines&.[](y_index + 3)&.[](x_index) == "S")
          count += 1
        elsif char == "S" &&
              (lines&.[](y_index + 1)&.[](x_index) == "A" &&
              lines&.[](y_index + 2)&.[](x_index) == "M" &&
              lines&.[](y_index + 3)&.[](x_index) == "X")
          count += 1
        end
      end
    end

    count
  end

  def diagonal # rubocop:disable Metrics/MethodLength
    count = 0

    lines.each_with_index do |line, y_index|
      line.chars.each_with_index do |char, x_index|
        if char == "X"
          count += 1 if check_diagonal(y_index, x_index, "M", "A", "S")
        elsif char == "S"
          count += 1 if check_diagonal(y_index, x_index, "A", "M", "X")
        end
      end
    end

    count
  end

  def edge_cases # rubocop:disable Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity,Metrics/AbcSize,Metrics/MethodLength
    count = 0

    lines.each_with_index do |line, y_index|
      line.chars.each_with_index do |char, x_index|
        if char == "M" && # rubocop:disable Style/Next,Lint/RedundantCopDisableDirective
           (lines&.[](y_index + 1)&.[](x_index) == "A" &&
           lines&.[](y_index + 2)&.[](x_index) == "S" &&
           lines&.[](y_index + 1)&.[](x_index - 1) == "M" &&
           lines&.[](y_index + 1)&.[](x_index + 1) == "S") ||
           (lines&.[](y_index + 1)&.[](x_index) == "A" &&
           lines&.[](y_index + 2)&.[](x_index) == "S" &&
           lines&.[](y_index + 1)&.[](x_index - 1) == "S" &&
           lines&.[](y_index + 1)&.[](x_index + 1) == "M")

          count += 1
        elsif char == "S" && # rubocop:disable Style/Next,Lint/RedundantCopDisableDirective
              (lines&.[](y_index + 1)&.[](x_index) == "A" &&
              lines&.[](y_index + 2)&.[](x_index) == "M" &&
              lines&.[](y_index + 1)&.[](x_index - 1) == "M" &&
              lines&.[](y_index + 1)&.[](x_index + 1) == "S") ||
              (lines&.[](y_index + 1)&.[](x_index) == "A" &&
              lines&.[](y_index + 2)&.[](x_index) == "M" &&
              lines&.[](y_index + 1)&.[](x_index - 1) == "S" &&
              lines&.[](y_index + 1)&.[](x_index + 1) == "M")

          count += 1
        end
      end
    end

    count
  end

  def edge_cases_diagonal # rubocop:disable Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity,Metrics/AbcSize,Metrics/MethodLength
    count = 0

    lines.each_with_index do |line, y_index|
      line.chars.each_with_index do |char, x_index|
        if char == "M" && # rubocop:disable Style/Next,Lint/RedundantCopDisableDirective
           (lines&.[](y_index + 1)&.[](x_index + 1) == "A" &&
           lines&.[](y_index + 2)&.[](x_index + 2) == "S" &&
           lines&.[](y_index + 2)&.[](x_index) == "M" &&
           lines&.[](y_index)&.[](x_index + 2) == "S") ||
           (lines&.[](y_index + 1)&.[](x_index + 1) == "A" &&
           lines&.[](y_index + 2)&.[](x_index + 2) == "S" &&
           lines&.[](y_index + 2)&.[](x_index) == "S" &&
           lines&.[](y_index)&.[](x_index + 2) == "M")

          count += 1
        elsif char == "S" && # rubocop:disable Style/Next,Lint/RedundantCopDisableDirective
              (lines&.[](y_index + 1)&.[](x_index + 1) == "A" &&
              lines&.[](y_index + 2)&.[](x_index + 2) == "M" &&
              lines&.[](y_index + 2)&.[](x_index) == "M" &&
              lines&.[](y_index)&.[](x_index + 2) == "S") ||
              (lines&.[](y_index + 1)&.[](x_index + 1) == "A" &&
              lines&.[](y_index + 2)&.[](x_index + 2) == "M" &&
              lines&.[](y_index + 2)&.[](x_index) == "S" &&
              lines&.[](y_index)&.[](x_index + 2) == "M")

          count += 1
        end
      end
    end

    count
  end

  def solve_part_1 # rubocop:disable Naming/VariableNumber
    horizontal + vertical + diagonal + edge_cases + edge_cases_diagonal
  end

  private

  def check_diagonal(y_index, x_index, char1, char2, char3) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
    (lines&.[](y_index + 1)&.[](x_index + 1) == char1 &&
     lines&.[](y_index + 2)&.[](x_index + 2) == char2 &&
     lines&.[](y_index + 3)&.[](x_index + 3) == char3) ||
      (lines&.[](y_index + 1)&.[](x_index - 1) == char1 &&
       lines&.[](y_index + 2)&.[](x_index - 2) == char2 &&
       lines&.[](y_index + 3)&.[](x_index - 3) == char3)
  end
end
