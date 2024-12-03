# frozen_string_literal: true

require "red_nosed_report"

RSpec.describe RedNosedReport do
  describe "#initialize" do
    let!(:file_path) { "./fixtures/example_1.txt" }
    let!(:report) { RedNosedReport.new(file_path) }

    it "starts with a number of levels" do
      levels = [[7, 6, 4, 2, 1], [1, 2, 7, 8, 9], [9, 7, 6, 2, 1], [1, 3, 2, 4, 5], [8, 6, 4, 4, 1], [1, 3, 6, 7, 9]]

      expect(report).to be_a(RedNosedReport)
      expect(report.levels).to eq(levels)
    end
  end

  describe "instance_methods" do
    context "part 1" do
      let!(:file_path) { "./fixtures/example_1.txt" }
      let!(:report) { RedNosedReport.new(file_path) }

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
          increase_of_5 = [1, 2, 7, 8, 9]
          decrease_of_4 = [9, 7, 6, 2, 1]
          decreasing_within_thresholds = [7, 6, 4, 2, 1]
          increasing_within_thresholds = [1, 3, 6, 7, 9]

          expect(report.within_thresholds?(increase_then_decrease)).to be(true)
          expect(report.within_thresholds?(increase_of_5)).to be(false)
          expect(report.within_thresholds?(decrease_of_4)).to be(false)
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

      describe "#number_of_problem_dampener_safe_reports" do
        it "returns an integer of the number of 'problem dampener safe' reports" do
          number_of_problem_dampener_safe_reports = 4

          expect(report.number_of_problem_dampener_safe_reports).to eq(number_of_problem_dampener_safe_reports)
        end
      end

      describe "#make_safe!" do
        it "modifies a report by removing a maximum of one level" do
          unmodified_safe = [7, 6, 4, 2, 1]

          expect(report.make_safe!(unmodified_safe)).to eq(unmodified_safe)

          unsafe_1 = [1, 2, 7, 8, 9]

          expect(report.make_safe!(unsafe_1)).to eq(unsafe_1)

          unsafe_2 = [9, 7, 6, 2, 1]

          expect(report.make_safe!(unsafe_2)).to eq(unsafe_2)

          second_level = [1, 3, 2, 4, 5]
          result = [1, 2, 4, 5]

          expect(report.make_safe!(second_level)).to eq(result)

          third_level = [8, 6, 4, 4, 1]
          result = [8, 6, 4, 1]

          expect(report.make_safe!(third_level)).to eq(result)

          unmodified_safe = [1, 3, 6, 7, 9]

          expect(report.make_safe!(unmodified_safe)).to eq(unmodified_safe)

          edge_case = [1, 2, 3, 4, 5, 5]
          result = [1, 2, 3, 4, 5]

          expect(report.make_safe!(edge_case)).to eq(result)
        end
      end

      describe "#is_otherwise_ascending?" do
        it "checks to see if an array would be ascending by removing one level" do
          unmodified_safe = [7, 6, 4, 2, 1]

          expect(report.is_otherwise_ascending?(unmodified_safe)).to be(false)

          unsafe_1 = [1, 2, 7, 8, 9]

          expect(report.is_otherwise_ascending?(unsafe_1)).to be(true)

          unsafe_2 = [9, 7, 6, 2, 1]

          expect(report.is_otherwise_ascending?(unsafe_2)).to be(false)

          second_level = [1, 3, 2, 4, 5]

          expect(report.is_otherwise_ascending?(second_level)).to be(true)

          third_level = [8, 6, 4, 4, 1]

          expect(report.is_otherwise_ascending?(third_level)).to be(false)

          unmodified_safe = [1, 3, 6, 7, 9]

          expect(report.is_otherwise_ascending?(unmodified_safe)).to be(true)

          too_many = [1, 3, 3, 3, 6, 7, 9]

          expect(report.is_otherwise_ascending?(too_many)).to be(false)

          edge_case = [75, 77, 72, 70, 69]

          expect(report.is_otherwise_ascending?(edge_case)).to be(false)
        end
      end

      describe "#is_otherwise_descending?" do
        it "checks to see if an array would be descending by removing one level" do
          unmodified_safe = [7, 6, 4, 2, 1]

          expect(report.is_otherwise_descending?(unmodified_safe)).to be(true)

          unsafe_1 = [1, 2, 7, 8, 9]

          expect(report.is_otherwise_descending?(unsafe_1)).to be(false)

          unsafe_2 = [9, 7, 6, 2, 1]

          expect(report.is_otherwise_descending?(unsafe_2)).to be(true)

          second_level = [1, 3, 2, 4, 5]

          expect(report.is_otherwise_descending?(second_level)).to be(false)

          third_level = [8, 6, 4, 4, 1]

          expect(report.is_otherwise_descending?(third_level)).to be(true)

          unmodified_safe = [1, 3, 6, 7, 9]

          expect(report.is_otherwise_descending?(unmodified_safe)).to be(false)

          too_many = [9, 7, 7, 7, 6, 2, 1]

          expect(report.is_otherwise_descending?(too_many)).to be(false)

          edge_case = [75, 77, 72, 70, 69]

          expect(report.is_otherwise_descending?(edge_case)).to be(true)
        end
      end
    end
  end
end
