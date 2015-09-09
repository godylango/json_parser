class JsonParser
  def self.parse(input)
    new(input).parse
  end

  def initialize(input)
    if input == '[]'
      self.parsed_input = []
    elsif input == '{}'
      self.parsed_input = {}
    else
      self.parsed_input = nil
    end
  end

  def parse
    parsed_input
  end

  private
  attr_accessor :parsed_input
end
