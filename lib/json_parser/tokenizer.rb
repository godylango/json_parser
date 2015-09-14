class JsonParser
  class Tokenizer
    def self.tokenize(input)
      tokenizer = Tokenizer.new(input)
      tokenizer.tokens
    end

    attr_reader :tokens

    def initialize(input)
      @scanner = StringScanner.new(input)
      @tokens = []
      tokenize
    end

    private

    def tokenize
      until scanner.eos?
        tokens << next_token
      end

      tokens
    end

    def next_token
      [].tap do |next_token|
        matchers.detect do |type, matcher|
          if scanner.scan(matcher)
            next_token << type << scanner.matched
          end
        end
      end
    end

    def matchers
      [[:array, /[\[\]]/],
       [:number, /\d+/],
       [:string, /"(?:[^"\\]|\\.)*"/],
       [:comma, /,/],
       [:colon, /:/],
       [:object, /[{}]/],
       [:space, /\s/],
       [:true, /true/],
       [:false, /false/],
       [:null, /null/],
       [:unknown, /./]]
    end

    attr_reader :scanner
  end
end
