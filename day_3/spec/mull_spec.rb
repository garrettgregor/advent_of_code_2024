# frozen_string_literal: true

require "../spec_helper"
require "mull"

RSpec.describe Mull do
  describe "instance_methods" do
    context "when solving part 1" do
      let!(:file_path) { "./fixtures/example_1.txt" }
      let!(:instance) { described_class.new(file_path) }

      describe "#initialize" do
        it "is a Mull" do
          expect(instance).to be_a(described_class)
        end
      end

      describe "#raw_instructions" do
        it "starts with raw instructions keeping individual lines as separate arrays" do
          result = [["mul(2,4)", "mul(5,5)", "mul(11,8)", "mul(8,5)"]]

          expect(instance.raw_instructions).to eq(result)
        end
      end

      describe "#parsed_instructions" do
        it "parses raw instructions and converts to integers" do
          result = [[[2, 4], [5, 5], [11, 8], [8, 5]]]

          expect(instance.parsed_instructions).to eq(result)
        end
      end

      describe "#values_to_add" do
        it "collects products of each array respective of lines" do
          result = [[8, 25, 88, 40]]

          expect(instance.values_to_add).to eq(result)
        end
      end

      describe "#line_sums" do
        it "collects sums respective of lines" do
          result = [161]

          expect(instance.line_sums).to eq(result)
        end
      end

      describe "#sum_of_all_lines" do
        it "returns a sum of all lines' sums of products" do
          result = 161

          expect(instance.sum_of_all_lines).to eq(result)
        end
      end
    end
  end
end
