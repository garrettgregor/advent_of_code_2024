class HistorianHysteria
  attr_reader :list, :left_list, :right_list

  def initialize(file_path)
    @list = File.open(file_path).map do |line|
      line.strip.split(/\D/).reject { |c| c.empty? }
    end

    @left_list = list.map { |line| line[0].to_i }.sort
    @right_list = list.map { |line| line[1].to_i }.sort
  end

  def differences
    results = []

    left_list.each_with_index do |left_el, left_i|
      results << (left_el-right_list[left_i]).abs
    end

    results
  end

  def sum_of_differences
    differences.sum
  end
end
