class JsonParser
  class ValueParser < BaseParser
    STRING_MATCHER = /\A"[\w\s]+"\z/
    NUMBER_MATCHER = /\A\d+\z/

    def parse
      case input
      when 'true'
        true
      when 'false'
        false
      when STRING_MATCHER
        read_string(input)
      when NUMBER_MATCHER
        read_number(input)
      end
    end

    private

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
