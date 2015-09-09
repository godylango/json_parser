class JsonParser
  class ArrayParser
    def self.parse(input)
      new(input).parse
    end

    def initialize(input)
      @input = input
    end

    def parse
      values.map { |value| ValueParser.parse(value) }
    end

    private
    attr_reader :input

    def values
      unwrapped.split(',')
    end

    def unwrapped
      input[1..-2]
    end
  end
end
