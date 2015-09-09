class JsonParser
  class ArrayParser
    def self.parse(input)
      new(input).parse
    end

    def initialize(input)
      @input = input
    end

    def parse
      values.map { |value| parse_value(value) }
    end

    private
    attr_reader :input

    def read_number(number)
      number.to_i
    end

    def read_string(string)
      unwrap_string(string)
    end

    def unwrap_string(string)
      string[1..-2]
    end

    def parse_value(value)
      case value
      when 'true'
        true
      when 'false'
        false
      when /\A"[\w\s]+"\z/
        read_string(value)
      when /\A\d+\z/
        read_number(value)
      end
    end

    def values
      unwrapped.split(',')
    end

    def unwrapped
      input[1..-2]
    end
  end
end
