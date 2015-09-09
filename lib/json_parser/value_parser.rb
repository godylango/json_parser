class JsonParser
  class ValueParser < BaseParser
    def parse
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
