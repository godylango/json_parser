class JsonParser
  class ArrayParser < BaseParser
    def parse
      values.map { |value| ValueParser.parse(value) }
    end

    private
    def values
      unwrapped.split(',')
    end

    def unwrapped
      input[1..-2]
    end
  end
end
