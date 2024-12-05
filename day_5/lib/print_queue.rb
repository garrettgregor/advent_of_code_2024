# frozen_string_literal: true

class PrintQueue
  attr_reader :raw_rules, :raw_updates, :correct_updates, :incorrect_updates

  def initialize(file_path)
    @raw_rules = File.readlines(file_path, chomp: true).filter_map do |line|
      line if line.include?("|")
    end
    @raw_updates = File.readlines(file_path, chomp: true).filter_map do |line|
      line if line.include?(",")
    end
    @correct_updates = []
    @incorrect_updates = []
  end

  def parsed_rules
    results = {}

    raw_rules.each do |rule|
      key, value = rule.strip.split("|")
      if !results[key.to_i]
        results[key.to_i] = [value.to_i]
      else
        results[key.to_i] << value.to_i
      end
    end

    results
  end
end
