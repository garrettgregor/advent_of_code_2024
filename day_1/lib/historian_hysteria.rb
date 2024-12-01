class HistorianHysteria
  attr_reader :list

  def initialize(file_path)
    @list = File.open(file_path).map do |line|
      require 'pry'; binding.pry
    end
  end

end
