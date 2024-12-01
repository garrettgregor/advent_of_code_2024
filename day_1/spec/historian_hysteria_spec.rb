# frozen_string_literal: true

require "historian_hysteria"

RSpec.describe HistorianHysteria do
  describe "#initialize" do
    it "takes a txt file and splits the two columns into separate lists" do
      file_path = "./fixtures/instructions.txt"
      
      historian = HistorianHysteria.new(file_path)
    end
  end
end
