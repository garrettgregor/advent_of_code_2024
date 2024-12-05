# frozen_string_literal: true

require "../spec_helper"
require "print_queue"

RSpec.describe PrintQueue do
  describe "instance_methods" do
    context "when solving part 1" do
      let!(:file_path) { "./fixtures/example_1.txt" }
      let!(:instance) { described_class.new(file_path) }

      describe "#initialize" do
        it "starts with rules and update, and space for correct and incorrect updates" do
          raw_rules = ["47|53", "97|13", "97|61", "97|47", "75|29", "61|13", "75|53", "29|13", "97|29", "53|29",
                       "61|53", "97|53", "61|29", "47|13", "75|47", "97|75", "47|61", "75|61", "47|29", "75|13", "53|13"] # rubocop:disable Layout/LineLength
          raw_updates = ["75,47,61,53,29", "97,61,53,29,13", "75,29,13", "75,97,47,61,53", "61,13,29", "97,13,75,29,47"]
          correct_updates = []
          incorrect_updates = []

          expect(instance).to be_a(described_class)
          expect(instance.raw_rules).to eq(raw_rules)
          expect(instance.raw_updates).to eq(raw_updates)
          expect(instance.correct_updates).to eq(correct_updates)
          expect(instance.incorrect_updates).to eq(incorrect_updates)
        end
      end

      describe "#parsed_rules" do
        it "parses the raw rules" do
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

      describe "#parsed_updates" do
        it "parses the raw updates and keeps the lines preserved" do
          results = [
            [75, 47, 61, 53, 29],
            [97, 61, 53, 29, 13],
            [75, 29, 13],
            [75, 97, 47, 61, 53],
            [61, 13, 29],
            [97, 13, 75, 29, 47]
          ]

          expect(instance.parsed_updates).to eq(results)
        end
      end

      describe "#follows_rules?" do
        it "checks whether a given update follows the rules" do
          update_1 = [75, 47, 61, 53, 29]
          update_2 = [97, 61, 53, 29, 13]
          update_3 = [75, 29, 13]
          update_4 = [75, 97, 47, 61, 53]
          update_5 = [61, 13, 29]
          update_6 = [97, 13, 75, 29, 47]

          expect(instance.follows_rules?(update_1)).to be(true)
          expect(instance.follows_rules?(update_2)).to be(true)
          expect(instance.follows_rules?(update_3)).to be(true)
          expect(instance.follows_rules?(update_4)).to be(false)
          expect(instance.follows_rules?(update_5)).to be(false)
          expect(instance.follows_rules?(update_6)).to be(false)
        end
      end
    end
  end
end
