class JsonParser
  class ValueParser
    def self.parse(input)
      new(input).parse_value
    end

    def initialize(input)
      @input = input
    end

    def parse_value
      case input
      when 'true'
        true
      when 'false'
        false
      when /\A"[\w\s]+"\z/
        read_string(input)
      when /\A\d+\z/
        read_number(input)
      end
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
  end
end
