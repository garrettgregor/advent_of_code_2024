# frozen_string_literal: true

require "../spec_helper"
require "red_nosed_report"

RSpec.describe RedNosedReport do
  describe "#initialize" do
    let!(:file_path) { "./fixtures/example_1.txt" }
    let!(:report) { described_class.new(file_path) }

    it "starts with a number of levels" do
      levels = [[7, 6, 4, 2, 1], [1, 2, 7, 8, 9], [9, 7, 6, 2, 1], [1, 3, 2, 4, 5], [8, 6, 4, 4, 1], [1, 3, 6, 7, 9]]

      expect(report).to be_a(described_class)
      expect(report.levels).to eq(levels)
    end
  end

  describe "instance_methods" do
    context "when solving part 1" do
      let!(:file_path) { "./fixtures/example_1.txt" }
      let!(:puzzle_input) { "./fixtures/puzzle_input_1.txt" }
      let!(:report) { described_class.new(file_path) }
      let!(:solver) { described_class.new(puzzle_input) }

      describe "#all_increasing?" do
        it "returns a boolean if all of the elements in a given array are increasing" do
          all_decreasing = [7, 6, 4, 2, 1]
          not_all_increasing = [1, 3, 2, 4, 5]
          all_increasing = [1, 3, 6, 7, 9]
          equal_elements = [8, 6, 4, 4, 1]

          expect(report.all_increasing?(all_decreasing)).to be(false)
          expect(report.all_increasing?(not_all_increasing)).to be(false)
          expect(report.all_increasing?(all_increasing)).to be(true)
          expect(report.all_increasing?(equal_elements)).to be(false)
        end
      end

      describe "#all_decreasing?" do
        it "returns a boolean if all of the elements in a given array are decreasing" do
          all_decreasing = [7, 6, 4, 2, 1]
          not_all_increasing = [1, 3, 2, 4, 5]
          all_increasing = [1, 3, 6, 7, 9]
          equal_elements = [8, 6, 4, 4, 1]

          expect(report.all_decreasing?(all_decreasing)).to be(true)
          expect(report.all_decreasing?(not_all_increasing)).to be(false)
          expect(report.all_decreasing?(all_increasing)).to be(false)
          expect(report.all_decreasing?(equal_elements)).to be(false)
        end
      end

      describe "#within_thresholds?" do
        it "returns a boolean if all of the elements in a given array are within the set thresholds" do
          increase_then_decrease = [1, 3, 2, 4, 5]
          increase_of_five = [1, 2, 7, 8, 9]
          decrease_of_four = [9, 7, 6, 2, 1]
          decreasing_within_thresholds = [7, 6, 4, 2, 1]
          increasing_within_thresholds = [1, 3, 6, 7, 9]

          expect(report.within_thresholds?(increase_then_decrease)).to be(true)
          expect(report.within_thresholds?(increase_of_five)).to be(false)
          expect(report.within_thresholds?(decrease_of_four)).to be(false)
          expect(report.within_thresholds?(decreasing_within_thresholds)).to be(true)
          expect(report.within_thresholds?(increasing_within_thresholds)).to be(true)
        end
      end

      describe "#number_of_safe_reports" do
        it "returns an integer of the number of 'safe' reports" do
          number_of_safe_reports = 2

          expect(report.number_of_safe_reports).to eq(number_of_safe_reports)
        end
      end

      describe "#problem_dampener_safe_reports" do
        it "returns an integer of the number of 'problem dampener safe' reports" do
          problem_dampener_safe_reports = 528

          expect(solver.problem_dampener_safe_reports).to eq(problem_dampener_safe_reports)
        end
      end
    end
  end
end
