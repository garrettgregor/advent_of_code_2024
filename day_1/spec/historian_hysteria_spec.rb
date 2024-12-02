# frozen_string_literal: true

require "historian_hysteria"

RSpec.describe HistorianHysteria do
  describe "#initialize" do
    let!(:file_path) { "./fixtures/instructions.txt" }
    let!(:historian) { HistorianHysteria.new(file_path) }

    it "starts with a list" do
      list = [["3", "4"], ["4", "3"], ["2", "5"], ["1", "3"], ["3", "9"], ["3", "3"]]

      expect(historian).to be_a(HistorianHysteria)
      expect(historian.list).to eq(list)
    end

    it "has a left list and a right list that are each sorted" do
      left_list = [1, 2, 3, 3, 3, 4]
      right_list = [3, 3, 3, 4, 5, 9]

      expect(historian.left_list).to eq(left_list)
      expect(historian.right_list).to eq(right_list)
    end
  end

  describe "instance_methods" do
    let!(:file_path) { "./fixtures/instructions.txt" }
    let!(:historian) { HistorianHysteria.new(file_path) }

    describe "#differences" do
      it "creates a list of the differences between the two lists" do
        differences = [2, 1, 0, 1, 2, 5]

        expect(historian.differences).to eq(differences)
      end
    end

    describe "#sum_of_differences" do
      it "returns a sum of all the differences added together" do
        sum = 11

        expect(historian.sum_of_differences).to eq(sum)
      end
    end
  end
end
