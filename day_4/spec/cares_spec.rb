# frozen_string_literal: true

require "../spec_helper"
require "cares"

RSpec.describe Cares do
  describe "#initialize" do
    let!(:file_path) { "./fixtures/test_input.txt" }
    let!(:instance) { described_class.new(file_path) }

    it "starts with each line parsed, an empty array for checked coordinates, and a counter" do
      # result = [
      #   ["M", "M", "M", "S", "X", "X", "M", "A", "S", "M"],
      #   ["M", "S", "A", "M", "X", "M", "S", "M", "S", "A"],
      #   ["A", "M", "X", "S", "X", "M", "A", "A", "M", "M"],
      #   ["M", "S", "A", "M", "A", "S", "M", "S", "M", "X"],
      #   ["X", "M", "A", "S", "A", "M", "X", "A", "M", "M"],
      #   ["X", "X", "A", "M", "M", "X", "X", "A", "M", "A"],
      #   ["S", "M", "S", "M", "S", "A", "S", "X", "S", "S"],
      #   ["S", "A", "X", "A", "M", "A", "S", "A", "A", "A"],
      #   ["M", "A", "M", "M", "M", "X", "M", "M", "M", "M"],
      #   ["M", "X", "M", "X", "A", "X", "M", "A", "S", "X"]
      # ]
      result = ["MMMSXXMASM", "MSAMXMSMSA", "AMXSXMAAMM", "MSAMASMSMX", "XMASAMXAMM", "XXAMMXXAMA", "SMSMSASXSS", "SAXAMASAAA", "MAMMMXMMMM", "MXMXAXMASX"]

      expect(instance).to be_a(described_class)
      expect(instance.lines).to eq(result)
      expect(instance.checked_coords).to eq([])
      expect(instance.xmas_strings_found).to eq(0)
    end
  end

  describe "instance_methods" do
    context "when solving part 1" do
      let!(:file_path) { "./fixtures/test_input.txt" }
      let!(:instance) { described_class.new(file_path) }

      describe "#horizontal" do
        it "accounts for XMAS string forward or reverse" do
          expect(instance.horizontal).to eq(5)
        end
      end

      describe "#vertical" do
        it "accounts for XMAS string upwards or downwards" do
          expect(instance.vertical).to eq(3)
        end
      end

      describe "#diagonal" do
        it "accounts for XMAS string upwards or downwards" do
          expect(instance.diagonal).to eq(8)
        end
      end

      describe "#edge_cases" do
        it "accounts for overlapping" do
          expect(instance.edge_cases).to eq(2)
        end
      end

      describe "#solve_part_1" do
        it "solves part 1" do
          expect(instance.solve_part_1).to eq(18)
        end
      end
    end
  end
end
