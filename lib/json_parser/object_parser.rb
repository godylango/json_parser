class JsonParser
  class ObjectParser
    def self.parse(input)
      new(input).parse
    end

    def initialize(input)
      @input = input
    end

    def parse
      unwrap(input).split(/,/).inject({}) do |pairs, value|
        if /"\w+":"?\w+"?/.match(value)
          pair = value.split(':')
          pairs.merge(unwrap(pair.first) => ValueParser.parse(pair.last))
        end
      end
    end

    private
    attr_reader :input

    def unwrap(input)
      input[1..-2]
    end
  end
end
