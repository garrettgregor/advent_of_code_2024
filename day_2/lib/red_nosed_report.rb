# frozen_string_literal: true

class RedNosedReport
  SAFE_MIN_THRESHOLD = 1
  SAFE_MAX_THRESHOLD = 3
  MAX_NUM_OF_LEVELS_TO_REMOVE = 1

  attr_reader :levels

  def initialize(file_path)
    @levels = File.open(file_path).map do |line|
      to_be_converted = line.strip.split(/\D/).reject(&:empty?)
      to_be_converted.map(&:to_i)
    end
  end

  def all_increasing?(report)
    checks = []

    report.each_cons(2) do |r|
      checks << (r[0] < r[1])
    end

    checks.all?(true)
  end

  def all_decreasing?(report)
    checks = []

    report.each_cons(2) do |r|
      checks << (r[0] > r[1])
    end

    checks.all?(true)
  end

  def within_thresholds?(report)
    checks = []

    report.each_cons(2) do |r|
      value_to_check = (r[0] - r[1]).abs

      checks << ((value_to_check >= SAFE_MIN_THRESHOLD) && (value_to_check <= SAFE_MAX_THRESHOLD))
    end

    checks.all?(true)
  end

  def number_of_safe_reports
    count = 0

    levels.each do |level|
      count += 1 if (all_decreasing?(level) || all_increasing?(level)) && within_thresholds?(level)
    end

    count
  end

  def number_of_problem_dampener_safe_reports
    safe_levels = []

    levels.each do |level|
      safe_levels << make_safe!(level)
    end

    count = 0

    safe_levels.each do |safe_level|
      count += 1 if (all_decreasing?(safe_level) || all_increasing?(safe_level)) && within_thresholds?(safe_level)
    end

    count
  end

  def problem_dampener_safe_reports # rubocop:disable Metrics/MethodLength,Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity
    count = 0
    unsafe_levels = []
    safe_without_problem_dampener = []
    safe_with_problem_dampener = []

    levels.each do |level|
      if (all_decreasing?(level) || all_increasing?(level)) && within_thresholds?(level)
        count += 1
        safe_without_problem_dampener << level
      else
        unsafe_levels << level
      end
    end

    unsafe_levels.each do |level|
      n = level.count - 1

      (0..n).each do |a|
        copy = level.dup
        copy.slice!(a)

        next unless (all_decreasing?(copy) || all_increasing?(copy)) && within_thresholds?(copy)

        count += 1
        safe_with_problem_dampener << copy
        break
      end
    end

    safe_with_problem_dampener.count + safe_without_problem_dampener.count
  end
end
