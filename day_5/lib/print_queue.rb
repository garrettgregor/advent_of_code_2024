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

  def parsed_updates
    results = []

    raw_updates.each do |update|
      results << update.split(",").map(&:to_i)
    end

    results
  end

  def follows_rules?(update) # rubocop:disable Metrics/MethodLength
    update = update.dup

    n = update.length - 1

    n.times do
      rule_key = update.shift
      subsequent_set = update
      elements_that_show_follow_if_they_exist = parsed_rules[rule_key]

      subsequent_set.each do |el|
        # use safe nav here in the event a rule key does not exist
        return false unless elements_that_show_follow_if_they_exist&.include?(el)
      end
    end

    true
  end
end
