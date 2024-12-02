# frozen_string_literal: true

class RedNosedReport
  SAFE_MIN_THRESHOLD = 1
  SAFE_MAX_THRESHOLD = 3

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
end
