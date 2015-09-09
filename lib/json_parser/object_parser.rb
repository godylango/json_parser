class JsonParser
  class ObjectParser < BaseParser
    def parse
      unwrap(input).split(/,/).inject({}) do |pairs, value|
        if /"\w+":"?\w+"?/.match(value)
          pair = value.split(':')
          pairs.merge(unwrap(pair.first) => ValueParser.parse(pair.last))
        end
      end
    end

    private

    def unwrap(input)
      input[1..-2]
    end
  end
end
