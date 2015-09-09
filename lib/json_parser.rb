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
      parse_array(input)
    when '{'
      {}
    else
      nil
    end
  end

  private
  attr_reader :input

  def parse_array(input)
    values = unwrap(input).split(',')
    values.map { |_| true }
  end

  def first_character
    input[0]
  end

  def unwrap(structure)
    structure[1..-2]
  end
end
