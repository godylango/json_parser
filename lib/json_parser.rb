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
    values.map { |value| parse_value(value) }
  end

  def parse_value(input)
    case input
    when 'true'
      true
    when 'false'
      false
    when /\A\d+\z/
      read_number(input)
    end
  end

  def read_number(input)
    input.to_i
  end

  def first_character
    input[0]
  end

  def unwrap(structure)
    structure[1..-2]
  end
end
