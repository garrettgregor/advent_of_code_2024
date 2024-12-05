# frozen_string_literal: true

require "../spec_helper"
require "print_queue"

RSpec.describe PrintQueue do
  describe "instance_methods" do
    context "when solving part 1" do
      describe "#initialize" do
        let!(:file_path) { "./fixtures/example_1.txt" }
        let!(:instance) { described_class.new(file_path) }

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
    end
  end
end
