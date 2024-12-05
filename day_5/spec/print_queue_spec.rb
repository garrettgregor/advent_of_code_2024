# frozen_string_literal: true

require "../spec_helper"
require "print_queue"

RSpec.describe PrintQueue do
  describe "instance_methods" do
    context "when solving part 1" do
      let!(:file_path) { "./fixtures/example_1.txt" }
      let!(:instance) { described_class.new(file_path) }

      describe "#parsed_rules" do
        it "starts with rules and update, and space for correct and incorrect updates" do
          results = {
            47 => [53, 13, 61, 29],
            97 => [13, 61, 47, 29, 53, 75],
            75 => [29, 53, 47, 61, 13],
            61 => [13, 53, 29],
            29 => [13],
            53 => [29, 13]
          }

          expect(instance.parsed_rules).to eq(results)
        end
      end
    end
  end
end
