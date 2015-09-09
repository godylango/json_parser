class JsonParser
  def self.parse(input)
    new(input).parse
  end

  def initialize(input)
    @input = input
  end

  def parse
    case first_character
    when '['
      ArrayParser.parse(input)
    when '{'
      ObjectParser.parse(input)
    else
      nil
    end
  end

  private
  attr_reader :input

  def first_character
    input[0]
  end
end

require 'json_parser/base_parser'
require 'json_parser/array_parser'
require 'json_parser/value_parser'
require 'json_parser/object_parser'
