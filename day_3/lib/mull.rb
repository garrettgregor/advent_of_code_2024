# frozen_string_literal: true

class Mull
  attr_reader :raw_instructions

  def initialize(file_path)
    @raw_instructions = File.readlines(file_path, chomp: true).map do |line|
      line.scan(/mul\(\d{1,3},\d{1,3}\)/)
    end
  end

  def parsed_instructions
    raw_instructions.map do |instructions|
      instructions.map do |instruction|
        instruction.scan(/\d{1,3}/).map(&:to_i)
      end
    end
  end

  def values_to_add
    parsed_instructions.map do |instructions|
      instructions.map do |instruction|
        instruction[0] * instruction[1]
      end
    end
  end

  def line_sums
    values_to_add.map(&:sum)
  end

  def sum_of_all_lines
    line_sums.sum
  end
end
