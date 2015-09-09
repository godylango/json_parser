class JsonParser
  class ObjectParser < BaseParser
    KEY_VALUE_PAIR_MATCHER = /"\w+":"?\w+"?/

    def parse
      unwrap(input).split(',').inject({}) do |pairs, value|
        if KEY_VALUE_PAIR_MATCHER.match(value)
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
