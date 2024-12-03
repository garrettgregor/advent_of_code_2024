# frozen_string_literal: true

class RedNosedReport
  SAFE_MIN_THRESHOLD = 1
  SAFE_MAX_THRESHOLD = 3
  MAX_NUM_OF_LEVELS_TO_REMOVE = 1

  attr_reader :levels

  def initialize(file_path)
    @levels = File.open(file_path).map do |line|
      to_be_converted = line.strip.split(/\D/).reject(&:empty?)
      to_be_converted.map do |num|
        num.to_i
      end
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

      checks << ((SAFE_MIN_THRESHOLD <= value_to_check) && (value_to_check <= SAFE_MAX_THRESHOLD))
    end

    checks.all?(true)
  end

  def number_of_safe_reports
    count = 0

    levels.each do |level|
      count += 1 if ((all_decreasing?(level) || all_increasing?(level)) && within_thresholds?(level))
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
      count += 1 if ((all_decreasing?(safe_level) || all_increasing?(safe_level)) && within_thresholds?(safe_level))
    end

    count
  end

  def make_safe!(report)
    if is_otherwise_ascending?(report)
      report.each_cons(2) do |r|
        if r[0] >= r[1]
          report.slice!(report.index(r[0]))
          return report
        end
      end
    elsif is_otherwise_descending?(report)
      report.each_cons(2) do |r|
        if r[1] >= r[0]
          report.slice!(report.index(r[1]))
          return report
        end
      end
    else
      return report
    end
  end

  def is_otherwise_ascending?(report)
    checks = []
    elements_removed = 0

    report.each_cons(2) do |r|
      if r[0] >= r[1] && elements_removed < MAX_NUM_OF_LEVELS_TO_REMOVE
        elements_removed += 1
      else
        checks << (r[0] < r[1])
      end
    end

    checks.all?(true)
  end

  def is_otherwise_descending?(report)
    checks = []
    elements_removed = 0

    report.each_cons(2) do |r|
      if r[1] >= r[0] && elements_removed < MAX_NUM_OF_LEVELS_TO_REMOVE
        elements_removed += 1
      else
        checks << (r[0] > r[1])
      end
    end

    checks.all?(true)
  end
end
